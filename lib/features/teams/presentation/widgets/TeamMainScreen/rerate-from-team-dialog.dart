import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/material-button-componat.dart';
import '../../../data/repository/team_repo.dart';
import '../../../domain/bloc/teams-bloc.dart';
import '../../../domain/bloc/teams-event.dart';
import '../../../domain/bloc/teams-state.dart';
import '../teams-method.dart';

class RetreatFromTeamDialog extends StatelessWidget {
  RetreatFromTeamDialog({super.key, required this.id});
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(listener: (context, state) {
          if (state is RetreatFromTeamErrorState) {
            teamsErrorCoolAlert(state,context,"حصل خطأ ما","عذراً");
          }
          if (state is RetreatFromTeamSuccessState) {
            teamsSuccessMethod(state, context, "تم الانسحاب من الفريق", "Success","pop");
          }
        }, child: BlocBuilder<TeamsBloc, TeamsState>(builder: (context, state) {
          print(state);

          return Directionality(
            textDirection: TextDirection.rtl,

            child: Container(
              child: AlertDialog(
                title: Center(child: Text('الانسحاب من الفريق',style: TextStyle(fontSize: 20),)),
                content: Text ("هل أنت متأكد من رغبتك بالانسحاب من الفريق"),
                // title: TextStyleExample(name : 'Basic Dialog Title',style : textTheme.titleLarge!),
                // content: TextStyleExample(name : "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made." ,style : textTheme.titleSmall!),
                actions: <Widget>[
                  MaterialButtonComponent(
                      onPressed: (){
                          context
                              .read<TeamsBloc>()
                              .add(RetreatFromTeamEvent(
                            id: id,
                          )
                          );

                        },
                      child: Text('الانسحاب',style: TextStyle(fontSize: 20),)),

                ],

              ),
            ),
          );
        }
        )
        )
    );
  }
}
