import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
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

class AdminAddTeam extends StatelessWidget {
   AdminAddTeam({super.key});
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
   final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
                if (state is InsertTeamsSuccessState ) {
                  teamsSuccessMethod(state, context , "تم إضافة الفريق" , "", "pop");
                }
                else if (state is InsertTeamsErrorState) {
                  teamsErrorCoolAlert(state,context, StringConst.somethingWrong,"حصل خطأ ما");
                }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  return SafeArea(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Scaffold(
                        appBar: AppBar(title: Text ("إضافة فريق"),),
                        body: Center(
                          child:
                          state is InsertTeamsLoadingState ?
                          MyLoadingScreen()
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
                                    Text("تساهم الفرق في إنشاء مجتمع الجمعية الفلكية السورية، لذا فإن كل فريق جديد يملك مهامه، ويملك توصيفه، ويعطي إضافة جديدة لعملنا المتماسك",
                                        style: normalTextStyle(fontSize: 25)
                                    ),
                                    UnderLineTextFieldComponant(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      maxLength: 50,
                                      labelText: "اسم الفريق",
                                      hintText: "الرجاء إدخال اسم الفريق",
                                      suffixIcon: Icon(Icons.people),
                                      controller: nameController,
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
                                      labelText: "وصف الفريق",
                                      hintText: "ما هي المهام والهدف من هذا الفريق؟",
                                      suffixIcon: Icon(Icons.description),
                                      controller: descriptionController,
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
                                          print("satart send");
                                          context
                                              .read<TeamsBloc>()
                                              .add(InsertTeamsEvent(description:descriptionController.text, name: nameController.text, type: "عام"
                                          ));

                                        }

                                      },
                                      child: Text("إضافة",
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
