import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/network/local/shared_prefrences_helper.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/JoinRequests/team-person-list-item.dart';
import '../widgets/set-team-supervisor-dialog.dart';
import '../widgets/teams-method.dart';

class TeamSetSupervisorScreen extends StatelessWidget {
   TeamSetSupervisorScreen({super.key, required this.teamId, required this.teamName});
  final int teamId;
  final String teamName;
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
              if (state is ShowAdminMemberErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,"حصل خطأ ما");
              }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if(state is TeamsInitState) {
                    context.read<TeamsBloc>().add(ShowAdminMemberEvent());

                  }
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text(teamName),
                      ),
                      body: Container(
                          margin: const EdgeInsets.all(20),
                          child:
                          state is ShowAdminMemberLoadingState ?
                              MyLoadingScreen()
                              :
                          state is ShowAdminMemberSuccessState ?

                          ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                          state.teamListModel.teamList[index]['id']!!= SharedPreferencesHelper.getData(key: "userId") ?
                          TeamPesonListItem(
                                  // listType: state.teamListModel.teamList[index]['english_name'],
                                  name: state.teamListModel.teamList[index]['english_name'],
                                  email: state.teamListModel.teamList[index]['email'],
                                  phone: state.teamListModel.teamList[index]['phone_number'],
                                  userImageUrl: state.teamListModel.teamList[index]['img_url'],
                                  onTap:(){
                                    showDialog(context: context,
                                    builder: (BuildContext context) {
                                    if (state.teamListModel.teamList[index]['id']!!= SharedPreferencesHelper.getData(key: "userId") )
                                    return
                                      SetSupervisoriar( teamId: teamId, memberId: state.teamListModel.teamList[index]['id'], teamName: teamName, memberName:state.teamListModel.teamList[index]['arabic_name'],);
                                  else
                                    return SizedBox();
                                    },
                                );
                                print(index);
                              } )
                          :
                          SizedBox(),
                          separatorBuilder: (context , index) => const SizedBox(height: 10,),
                          itemCount: state.teamListModel.teamList.length)
                              :
                              state is ShowAdminMemberErrorState?
                          Center(child: Text (
                            "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ",
                            style: normalTextStyle(),),)
                        :
                                  SizedBox()
                      ),

                    ),
                  );
                }
            )
        )
    );
  }
}



