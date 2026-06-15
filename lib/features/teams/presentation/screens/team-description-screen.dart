import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/teams-method.dart';

class TeamDescriptionScreen extends StatelessWidget {
   TeamDescriptionScreen({super.key, required this.description, required this.teamName, required this.id});
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
   final String teamName;
   final String description;
   final int id;

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
                teamsSuccessMethod(state,context, "بانتظار موافقة المشرف","","pop");
              }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text(teamName,overflow: TextOverflow.ellipsis,maxLines: 1),
                      ),
                      body: Container(
                          margin: const EdgeInsets.all(20),
                          child:
                          state is JoinTeamRequestLoadingState ?
                          const MyLoadingScreen()
                              :
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Text (description,style: normalTextStyle()),
                              ),
                              const Spacer(),
                              // if (state is !JoinTeamRequestSuccessState)
                              MaterialButtonComponent(
                               onPressed: (){
                                 context.read<TeamsBloc>()
                                     .add(JoinTeamRequestEvent(id: id));
                                 },
                                child: Text(
                                    "الانضمام للفريق",
                                    style: buttonTextStyle(fontWeight: FontWeight.w900)
                                ),
                              ),
                            ],
                          )
                          //     :
                          // Center(child: Text (
                          //   "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ", style: Theme.of(context).textTheme.titleMedium,),)
                          //
                      ),

                    ),
                  );
                }
            )
        )
    );
  }
}
