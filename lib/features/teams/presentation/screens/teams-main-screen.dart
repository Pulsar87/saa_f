import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/teams/presentation/screens/team-common-question.dart';
import 'package:saa_f/features/teams/presentation/screens/team-description-screen.dart';
import 'package:saa_f/features/teams/presentation/screens/team-join-requests-screen.dart';
import 'package:saa_f/features/teams/presentation/screens/team-member-ratings.dart';
import 'package:saa_f/features/teams/presentation/screens/team-member-screen.dart';
import 'package:saa_f/features/teams/presentation/screens/team-set-supervisoir-screen.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/network/local/shared_prefrences_helper.dart';
import '../../../../core/router/animation_route.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/TeamMainScreen/join-to-team-dialog.dart';
import '../widgets/TeamMainScreen/rerate-from-team-dialog.dart';
import '../widgets/teams-method.dart';
import 'add-common-question.dart';

class TeamMainScreen extends StatelessWidget {
   TeamMainScreen({super.key, required this.teamName, required this.description, required this.id});
   final String teamName;
   final String description;
   final int id;
   final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
              if (state is JoinTeamRequestErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,"حصل خطأ ما");
              }
              if (state is JoinTeamRequestSuccessState) {
                teamsSuccessMethod(state,context, "بانتظار موافقة المشرف","","nothing");
              }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if (state is TeamsInitState) {
                    context
                        .read<TeamsBloc>()
                        .add(ShowTeamInfoEvent(id));
                  }
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text(teamName),
                      ),
                      body: Container(
                        margin: const EdgeInsets.all(20),
                        child:
                            state is ShowTeamInfoLoadingState?
                        MyLoadingScreen()
                                :
                        state is ShowTeamInfoSuccessState ?
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (SharedPreferencesHelper.getData(key: "مدير الجمعية") == "مدير الجمعية")
                                MaterialButtonComponent(
                                  onPressed: (){
                                    print("تعيين مشرف فريق");
                                    Navigator.of(context).push(MyAnimatedRoute(page: TeamSetSupervisorScreen(teamId: id,teamName: teamName,)));
                                      },
                                  child: Text("تعيين مشرف فريق",
                                  style: buttonTextStyle(fontWeight: FontWeight.w900)
                                  )),

                              MaterialButtonComponent(
                                  onPressed: (){
                                    print("؟من نحن");
                                    Navigator.of(context).push(MyAnimatedRoute(page: TeamDescriptionScreen(description: description, teamName: teamName,id: id,)));
                                  },
                                  child: Text("من نحن؟",
                                      style: buttonTextStyle(fontWeight: FontWeight.w900)
                                  )),

                              if(state.teamInfoModel.data!.isSupervisor! || state.teamInfoModel.data!.isTeamLeader! ||
                                  SharedPreferencesHelper.getData(key: "مدير الجمعية") == "مدير الجمعية")
                                MaterialButtonComponent(
                                  onPressed: (){
                                    print("إضافة أسئلة شائعة");
                                    Navigator.of(context).push(MyAnimatedRoute(page:  AddCommonQuestions(id: id,name: teamName,)));

                                  },
                                  child: Text("إضافة أسئلة شائعة", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white
                                  )
                                  )),

                              MaterialButtonComponent(
                                  onPressed: (){
                                    print("الأسئلة الشائعة");
                                    Navigator.of(context).push(MyAnimatedRoute(page: TeamCommonQuestion(id: id, teamName: teamName)));
                                  },
                                  child: Text("الأسئلة الشائعة",
                                      style: buttonTextStyle(fontWeight: FontWeight.w900)
                                  )),

                              if(state.teamInfoModel.data!.isSupervisor! || state.teamInfoModel.data!.isTeamLeader!)
                                MaterialButtonComponent(
                                  onPressed: (){
                                    print(state.teamInfoModel.data!.isSupervisor!);
                                    print("أعضاء الفريق");
                                    Navigator.of(context).push(MyAnimatedRoute(page:
                                    TeamMemberScreen(
                                      teamId: id,teamName: teamName,
                                      meIsSupervisor: state.teamInfoModel.data!.isSupervisor!,
                                        meIsTeamLeader: state.teamInfoModel.data!.isTeamLeader!
                                      ,)));
                                  },
                                  child: Text("أعضاء الفريق",
                                      style: buttonTextStyle(fontWeight: FontWeight.w900)
                                  )),

                              if(state.teamInfoModel.data!.isTeamMember! || state.teamInfoModel.data!.isTeamLeader!)
                                MaterialButtonComponent(
                                  onPressed: (){
                                    Navigator.of(context).push(MyAnimatedRoute(page: TeamMemberRatings(teamId: id,)));

                                    print("عرض التقييمات");
                                  },
                                  child: Text("تقييماتي", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white
                                  )
                                  )),

                              if( state.teamInfoModel.data!.isSupervisor! || state.teamInfoModel.data!.isTeamLeader!)
                                MaterialButtonComponent(
                                  onPressed: (){
                                    print("طلبات الانضمام ");
                                    Navigator.of(context).push(MyAnimatedRoute(page: TeamRequestsScreen(id: id,)));
                                    },
                                  child:
                                  Text(
                                    "طلبات الانضمام",
                                    style:buttonTextStyle(fontWeight: FontWeight.w900),)
                                ),

                              if(state.teamInfoModel.data!.isTeamMember! )
                                  MaterialButtonComponent(
                                  onPressed: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return RetreatFromTeamDialog(id: id,);
                                      },
                                    );
                                    print("الانسحاب من الفريق");

                                  },
                                  child: Text(" الانسحاب من الفريق", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white
                                  )
                                  )),

                              if(!(state.teamInfoModel.data!.isSupervisor! ||
                                  state.teamInfoModel.data!.isTeamMember!||
                                  state.teamInfoModel.data!.isTeamLeader! ||
                                  SharedPreferencesHelper.getData(key: "مدير الجمعية") == "مدير الجمعية"))
                              MaterialButtonComponent(
                                  onPressed: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return JoinToTeamDialog(id: id,);
                                      },
                                    );

                                    print("الانضمام للفريق");
                                  },
                                  child: Text("طلب انضمام",
                                      style: buttonTextStyle(fontWeight: FontWeight.w900)
                                  )),
                            ],
                          ),
                        )
                        :
                        Center(child: Text (
                          "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ", style: Theme.of(context).textTheme.titleMedium,),)
                      ),
                    ),
                  );
                }
            )
        )
    );

  }
}


