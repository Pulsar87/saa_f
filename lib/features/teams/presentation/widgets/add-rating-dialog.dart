import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saa_f/features/teams/presentation/widgets/teams-method.dart';
import '../../../../../core/components/material-button-componat.dart';
import '../../../../core/constant/colors/light-colors.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/themes/text_style.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';

class AddRating extends StatefulWidget {
  AddRating({super.key, required this.memberId, required this.teamId});
  final int memberId;
  final int teamId;

  @override
  State<AddRating> createState() => _AddRatingState();
}

class _AddRatingState extends State<AddRating> {
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
  DateTime dateTime = DateTime.now();
  int rate=3;
  // final onTap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(listener: (context, state) {
          if (state is AddRatingErrorState) {
            teamsErrorCoolAlert(state,context, StringConst.somethingWrong,StringConst.sorry);
          }
          if (state is AddRatingSuccessState) {
            teamsSuccessMethod(state, context, "تم إضافة التقييم", "","pop");
          }
        }, child: BlocBuilder<TeamsBloc, TeamsState>(builder: (context, state) {
          print(state);

          return Container(
            child: AlertDialog(
              title: Center(child: Text("إضافة تقييم",
                style: normalTextStyle(fontWeight: FontWeight.w700,fontSize: 25),

              )),
              content: Text ("إضافة تقييم",
                style: normalTextStyle(),
              ),
              // title: TextStyleExample(name : 'Basic Dialog Title',style : textTheme.titleLarge!),
              // content: TextStyleExample(name : "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made." ,style : textTheme.titleSmall!),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(onPressed: (){
                      ShowDatePicker(context);

                    }, child: Text ("تاريخ التقييم:",
                        style: normalTextStyle(),
                    )),
                    Text(
                      "${dateTime.day.toString()}/${dateTime.month.toString()}/${dateTime.year.toString()}",style: normalTextStyle(),),
                  ],
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: primaryColor,),
                      onRatingUpdate: (rating) {
                        rate = rating.toInt() ;
                        print(rate);
                      },
                    )

                  ],
                ),

                MaterialButtonComponent(
                    onPressed: () {
                      context.read<TeamsBloc>().add(AddRatingEvent(memberId: widget.memberId, teamId: widget.teamId,date: "${dateTime.year.toString()}-${dateTime.month.toString()}-${dateTime.day.toString()}",rate: rate));
                      print(rate);
                    } ,
                    child: Text("إضافة",
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

  void ShowDatePicker (context) {showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025)
  ).then((value) {
    setState(() {
      dateTime = value!;
    });

  }
  );
  }
}





