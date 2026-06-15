import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/teams/presentation/widgets/teams-method.dart';

import '../../../../../core/components/material-button-componat.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/themes/text_style.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';

class SetLeader extends StatelessWidget {
  SetLeader({super.key, required this.memberId, required this.teamId});
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
  final int memberId;
  final int teamId;
  // final onTap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(listener: (context, state) {
          if (state is SpecifyTeamLeaderErrorState) {
            teamsErrorCoolAlert(state,context, StringConst.somethingWrong,StringConst.sorry);

          }
          // if (state is MemberDeleteFromTeamErrorState) {
          //   teamsErrorCoolAlert(state,context,"حصل خطأ ما","عذراً");
          // }
          if (state is SpecifyTeamLeaderSuccessState) {
            teamsSuccessMethod(state, context, "تم تعيين العضو كقائد", "","pop");
          }
          // if (state is MemberDeleteFromTeamSuccessState) {
          //   teamsSuccessMethod(state, context, "تم حذف العضو", "Success","pop");
          // }
        }, child: BlocBuilder<TeamsBloc, TeamsState>(builder: (context, state) {
          print(state);

          return Container(
            child: AlertDialog(
              title: Center(child: Text("تعيين قائد",
                style: normalTextStyle(fontWeight: FontWeight.w700,fontSize: 25),
              )),
              content: Text ("هل أنتَ متأكد من رغبتكَ بتعيين هذا العضو قائداً للفريق",
                style: normalTextStyle(),
              ),
              // title: TextStyleExample(name : 'Basic Dialog Title',style : textTheme.titleLarge!),
              // content: TextStyleExample(name : "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made." ,style : textTheme.titleSmall!),
              actions: <Widget>[
                MaterialButtonComponent(
                    onPressed: () {
                      context.read<TeamsBloc>().add(SpecifyTeamLeaderEvent(memberId: memberId, teamId: teamId));

                    } ,
                    child: Text("تعيين",
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
