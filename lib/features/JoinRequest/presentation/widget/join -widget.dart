import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/unit/enum.dart';
import '../../../../core/unit/list.dart';
import '../../domain/bloc/join_bloc.dart';
import 'join-radio.dart';
class JoinSelection extends StatefulWidget {
  const JoinSelection({super.key, this.number});

  final int? number;

  @override
  _JoinSelectionState createState() => _JoinSelectionState();
}

class _JoinSelectionState extends State<JoinSelection> {
  @override
  Widget build(BuildContext context) {
    JoinBloc bloc = context.read<JoinBloc>();

    return widget.number == 1
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              JoinRadio(
                text: showLevelStrings(bloc.selectedLevel)[0],
                value: Level.basic,
                groupValue: bloc.selectedLevel,
                onChanged: (dynamic value) {
                  setState(() {
                    bloc.selectedLevel = value;
                  });
                },
              ),
              JoinRadio(
                text: showLevelStrings(bloc.selectedLevel)[1],
                value: Level.middle,
                groupValue: bloc.selectedLevel,
                onChanged: (dynamic value) {
                  setState(() {
                    bloc.selectedLevel = value;
                  });
                },
              ),
              JoinRadio(
                text: showLevelStrings(bloc.selectedLevel)[2],
                value: Level.advanced,
                groupValue: bloc.selectedLevel,
                onChanged: (dynamic value) {
                  setState(() {
                    bloc.selectedLevel = value;
                  });
                },
              ),
              JoinRadio(
                text: showLevelStrings(bloc.selectedLevel)[3],
                value: Level.specialist,
                groupValue: bloc.selectedLevel,
                onChanged: (dynamic value) {
                  setState(() {
                    bloc.selectedLevel = value;
                  });
                },
              ),
            ],
          )
        : widget.number == 2
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JoinRadio(
                    text: showAcademicStrings(bloc.selectedAcademic)[0],
                    value: Academic.basic,
                    groupValue: bloc.selectedAcademic,
                    onChanged: (dynamic value) {
                      setState(() {
                        bloc.selectedAcademic = value;
                      });
                    },
                  ),
                  JoinRadio(
                    text: showAcademicStrings(bloc.selectedAcademic)[1],
                    value: Academic.secondary,
                    groupValue: bloc.selectedAcademic,
                    onChanged: (dynamic value) {
                      setState(() {
                        bloc.selectedAcademic = value;
                      });
                    },
                  ),
                  JoinRadio(
                    text: showAcademicStrings(bloc.selectedAcademic)[2],
                    value: Academic.university,
                    groupValue: bloc.selectedAcademic,
                    onChanged: (dynamic value) {
                      setState(() {
                        bloc.selectedAcademic = value;
                      });
                    },
                  ),
                  JoinRadio(
                    text: showAcademicStrings(bloc.selectedAcademic)[3],
                    value: Academic.master,
                    groupValue: bloc.selectedAcademic,
                    onChanged: (dynamic value) {
                      setState(() {
                        bloc.selectedAcademic = value;
                      });
                    },
                  ),
                  JoinRadio(
                      text: showAcademicStrings(bloc.selectedAcademic)[4],
                      value: Academic.doctorate,
                      groupValue: bloc.selectedAcademic,
                      onChanged: (dynamic value) {
                        setState(() {
                          bloc.selectedAcademic = value;
                        });
                      }),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  JoinRadio(
                    text: showActivityStrings(bloc.selectedActivity)[0],
                    value: Activity.astronomy,
                    groupValue: bloc.selectedActivity,
                    onChanged: (dynamic value) {
                      setState(() {
                        bloc.selectedActivity = value;
                      });
                    },
                  ),
                  JoinRadio(
                    text: showActivityStrings(bloc.selectedActivity)[1],
                    value: Activity.monitoring,
                    groupValue: bloc.selectedActivity,
                    onChanged: (dynamic value) {
                      setState(() {
                        bloc.selectedActivity = value;
                      });
                    },
                  ),
                ],
              );
  }
}
