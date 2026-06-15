import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/team-common-question-list-item.dart';
import '../widgets/teams-method.dart';

class TeamCommonQuestion extends StatelessWidget {
   TeamCommonQuestion({super.key, required this.id, required this.teamName});
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
  final int id;
  final String teamName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
              if (state is GetTeamsCommonQuestionErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,"حصل خطأ ما");
              }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if(state is TeamsInitState) {
                    context.read<TeamsBloc>().add(GetTeamCommonQuestionEvent(id));
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
                            state is GetTeamsCommonQuestionLoadingState ?
                           MyLoadingScreen()
                                :
                            state is GetTeamsCommonQuestionSuccessState ?
                                state.teamsCommonQuestion.teamList.length ==0?
                                Center(child: Text (
                                  "لا يوجد أسئلة شائعة لهذا الفريق ",
                                  style: normalTextStyle(),),)

                                    :

                            ListView.separated(itemBuilder: (context,index) =>
                                TeamCommonQuestionListItem(question: state.teamsCommonQuestion.teamList[index]['question'],answer: state.teamsCommonQuestion.teamList[index]['answer']),
                                separatorBuilder:(context,index) => SizedBox(height: 10),
                                itemCount: state.teamsCommonQuestion.teamList.length!)
                                :
                                state is GetTeamsCommonQuestionErrorState?
                            Center(child: Text (
                              "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ", style: normalTextStyle(),),)
                        :
                                    SizedBox()
                        )


                      ),
                    ),
                  );
                }
            )
        )
    );

  }
}

