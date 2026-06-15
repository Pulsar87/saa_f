import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/components/text_form_field.dart';
import '../../../../core/components/under-line-text-filed-componant.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/router/router_name.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/teams-method.dart';

class AddCommonQuestions extends StatelessWidget {
  AddCommonQuestions({super.key, required this.id, required this.name});
  final int id;
  final String name;
  var questionController = TextEditingController();
  var answerController = TextEditingController();
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
              if (state is AddCommonQuestionSuccessState ) {
                teamsSuccessMethod(state, context , "تم الإضافة" , "", "pop");
              }
              else if (state is AddCommonQuestionErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,"عذراً");
              }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  return SafeArea(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Scaffold(
                        appBar: AppBar(title: Text (name),),
                        body: Center(
                          child:
                          state is AddCommonQuestionLoadingState ?
                          CircularProgressIndicator()
                              :
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("الأسئلة الشائعة تساعد الأشخاص الذين يرغبون بالانتساب للفريق على فهم عمل الفريق، وتقدير إمكانياتهم بإضافة أشياء جديدة لهذا الفريق",
                                        style: normalTextStyle(fontSize: 25)
                                    ),
                                    UnderLineTextFieldComponant(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      maxLength: 50,
                                      labelText: "إضافة سؤال",
                                      hintText: "",
                                      suffixIcon: Icon(Icons.people),
                                      controller: questionController,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "لا يمكن أن يبقى هذا الحقل فارغاً";
                                        }
                                      },
                                    ),
                                    UnderLineTextFieldComponant(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      maxLength: 500,
                                      labelText: "إضافة إجابة",
                                      hintText: "",
                                      suffixIcon: Icon(Icons.description),
                                      controller: answerController,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "لا يمكن أن يبقى هذا الحقل فارغاً";
                                        }
                                      },
                                    ),
                                    MaterialButtonComponent(
                                      verticalMargin: 16,
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          print("AddCommonQuestionEvent");
                                          context
                                              .read<TeamsBloc>()
                                              .add(AddCommonQuestionEvent( id: id, question: questionController.text, answer: answerController.text
                                          ));

                                        }

                                      },
                                      child: Text("إضافة سؤال",
                                          style: buttonTextStyle(fontWeight: FontWeight.w900)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            )
        )
    );
  }}
