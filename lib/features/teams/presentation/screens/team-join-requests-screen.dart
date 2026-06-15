import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/components/horizintal-line.dart';
import '../../../../core/constant/assets-const.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/JoinRequests/join-requests-list.dart';
import '../widgets/teams-method.dart';

class TeamRequestsScreen extends StatelessWidget {
   TeamRequestsScreen({super.key, required this.id});
final int id;
   final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
              if (state is ShowTeamJoinRequestErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,StringConst.sorry);
              }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if(state is TeamsInitState || state is TeamsRefreshState) {
                    context.read<TeamsBloc>().add(ShowTeamJoinRequestEvent(id));

                  }
                  return SafeArea(
                    child: Directionality(
                      textDirection: TextDirection.rtl,

                      child: Scaffold(
                        appBar: AppBar(
                          title: Text("طلبات الانضمام"),
                        ),
                        body: Container(
                            margin: const EdgeInsets.all(20),
                            child:
                            state is ShowTeamJoinRequestLoadingState ?
                          MyLoadingScreen()
                                :
                            state is ShowTeamJoinRequestSuccessState ?
                            state.teamMembersListModel.memberList.length ==0?
                            Center(child: Text (
                                "لا يوجد طلبات جديدة ",
                                style: normalTextStyle()),)

                                :

                          JoinRequestsList(joinList: state.teamMembersListModel.memberList,)
                                :
                            Center(child: Text (
                              "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ",
                              style: normalTextStyle(),),)

                        ),

                      ),
                    ),
                  );
                }
            )
        )
    );

  }
}


