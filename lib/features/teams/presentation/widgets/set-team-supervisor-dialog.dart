import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/features/teams/presentation/widgets/teams-method.dart';
import '../../../../../core/components/material-button-componat.dart';
import '../../../../core/themes/text_style.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';

class SetSupervisoriar extends StatelessWidget {
  SetSupervisoriar({super.key, required this.teamId, required this.memberId, required this.teamName, required this.memberName});
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
  final int teamId;
  final int memberId;
  final String teamName;
  final String memberName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(listener: (context, state) {
          if (state is SpecifyTeamSupervisorErrorState) {
            teamsErrorCoolAlert(state,context,StringConst.somethingWrong,"عذراً");
          }
          if (state is SpecifyTeamSupervisorSuccessState) {
            teamsSuccessMethod(state, context, "تم تعيين مشرف الفريق", "","pop");
          }
        }, child: BlocBuilder<TeamsBloc, TeamsState>(builder: (context, state) {
          print(state);

          return Container(
            child: AlertDialog(
              title: Center(child: Text('تعيين مشرف فريق',
                style: normalTextStyle(fontWeight: FontWeight.w700,fontSize: 25),
              )),
              content: Text ("هل أنت متأكد من رغبتك بتعيين $memberName كمشرف على الفريق $teamName",
                style: normalTextStyle(fontSize: 18),
              ),
              // title: TextStyleExample(name : 'Basic Dialog Title',style : textTheme.titleLarge!),
              // content: TextStyleExample(name : "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made." ,style : textTheme.titleSmall!),
              actions: <Widget>[
                MaterialButtonComponent(
                    onPressed: (){
                        context
                            .read<TeamsBloc>()
                            .add(SpecifyTeamSupervisorEvent(
                          memberId: memberId,
                          teamId: teamId,
                        )
                        );

                      },
                    child: Text('تعيين',
                        style: buttonTextStyle(fontWeight: FontWeight.w900)
                    )),

              ],

            ),
          );
        }
        )
        )
    );
  }
}
