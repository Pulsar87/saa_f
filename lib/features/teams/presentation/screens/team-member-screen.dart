import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/JoinRequests/member-list.dart';
import '../widgets/teams-method.dart';

class TeamMemberScreen extends StatelessWidget {
     TeamMemberScreen({super.key, required this.teamId, required this.teamName, required this.meIsTeamLeader, required this.meIsSupervisor,});
     final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
     final int teamId;
     final String teamName;
     final bool meIsTeamLeader;
     final bool meIsSupervisor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
              if (state is ShowAllTeamMemberErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,StringConst.sorry);
              }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if(state is TeamsInitState ||state is TeamsRefreshState) {
                    context.read<TeamsBloc>().add(ShowAllTeamMemberEvent(teamId));

                  }
                  return SafeArea(
                    child: Directionality(
                      textDirection: TextDirection.rtl,

                      child: Scaffold(
                        appBar: AppBar(
                          title: Text(teamName),
                        ),
                        body: Container(
                            margin: const EdgeInsets.all(20),
                            child:
                            state is ShowAllTeamMemberLoadingState ?
                          MyLoadingScreen()
                                :
                            state is ShowAllTeamMemberSuccessState ?
                            state.teamMemberListModel.teamList.length ==0?
                            Center(child: Text (
                              "لا يوجد أعضاء في هذا الفريق ",
                                style: normalTextStyle()),)

                                :

                            TeamMembersList(members: state.teamMemberListModel.teamList,teamId: teamId, meIsTeamLeader: meIsTeamLeader,meIsSupervisor: meIsSupervisor,)
                                :
                                state is ShowAllTeamMemberErrorState?
                            Center(child: Text (
                              "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ",
                          style: normalTextStyle(),),)
                        :
                                    SizedBox()

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


