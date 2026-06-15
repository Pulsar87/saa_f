import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/components/material-button-componat.dart';
import '../../../data/repository/team_repo.dart';
import '../../../domain/bloc/teams-bloc.dart';
import '../../../domain/bloc/teams-event.dart';
import '../../../domain/bloc/teams-state.dart';
import '../teams-method.dart';

class JoinToTeamDialog extends StatelessWidget {
  JoinToTeamDialog({super.key, required this.id});
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(listener: (context, state) {
          if (state is JoinTeamRequestErrorState) {
            teamsErrorCoolAlert(state,context,StringConst.somethingWrong,"عذراً");
          }
          if (state is JoinTeamRequestSuccessState) {
            teamsSuccessMethod(state, context, "تم إرسال طلب الانضمام للفريق","","pop");
          }
        }, child: BlocBuilder<TeamsBloc, TeamsState>(builder: (context, state) {
          print(state);

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              child: AlertDialog(
                title: Center(child: Text('الانضمام للفريق',
                  style: normalTextStyle(fontWeight: FontWeight.w700,fontSize: 25),
                )),
                content: Text ("هل أنت متأكد من رغبتك بالانضمام للفريق",
                  style: normalTextStyle(),
                ),
                // title: TextStyleExample(name : 'Basic Dialog Title',style : textTheme.titleLarge!),
                // content: TextStyleExample(name : "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made." ,style : textTheme.titleSmall!),
                actions: <Widget>[
                  MaterialButtonComponent(
                      onPressed: (){
                        context
                            .read<TeamsBloc>()
                            .add(JoinTeamRequestEvent(id: id));

                        },
                      child: Text('إرسال طلب الانضمام',
                          style: buttonTextStyle(fontWeight: FontWeight.w900)
                      )),

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
