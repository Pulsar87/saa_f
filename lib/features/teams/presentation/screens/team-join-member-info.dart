import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/components/dashboard-member-infoItem.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/constant/strings-const.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/teams-method.dart';

class TeamJoinMemberInfo extends StatelessWidget {
  TeamJoinMemberInfo( {super.key, required this.memberId, required this.joinRequestId});
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
  final int memberId;
  final int joinRequestId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
              if (state is AcceptJoinRequestErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,StringConst.sorry);
              }
              if (state is RefuseJoinRequestErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,StringConst.sorry);
              }
              if (state is AcceptJoinRequestSuccessState) {
                teamsSuccessMethod(state,context, "تم إضافة العضو","","pop");
              }
              if (state is RefuseJoinRequestSuccessState) {
                teamsSuccessMethod(state,context, "تم رفض الطلب","","pop");
              }

            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if(state is TeamsInitState) {
                    context.read<TeamsBloc>().add(ShowMemberInfoJoinEvent(memberId));

                  }
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text("معلومات العضو"),
                      ),
                      body: Container(
                          margin: const EdgeInsets.all(20),
                          child:
                          state is ShowMemberInfoJoinLoadingState ?
                          Center(child: CircularProgressIndicator())
                              :
                          state is ShowMemberInfoJointSuccessState ?
                          //
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              DashboardMemberInfoItem(dataType: "الاسم بالعربية: ",info: state.teamMemberInfoModel.data!.arabic_name!),
                              DashboardMemberInfoItem(dataType: "الاسم بالإنكليزية: ",info: state.teamMemberInfoModel.data!.english_name!),
                              DashboardMemberInfoItem(dataType: "البريد الإلكتروني: ",info: state.teamMemberInfoModel.data!.email!),
                              DashboardMemberInfoItem(dataType: "تاريخ الميلاد: ",info: state.teamMemberInfoModel.data!.BirthDate!),
                              DashboardMemberInfoItem(dataType: "المدينة: ",info: state.teamMemberInfoModel.data!.City!),
                              DashboardMemberInfoItem(dataType: "رقم الهاتف: ",info: state.teamMemberInfoModel.data!.phone_number!),
                              DashboardMemberInfoItem(dataType: "رقم واتساب: ",info: state.teamMemberInfoModel.data!.whatsapp_number!),
                              DashboardMemberInfoItem(dataType: "المستوى العلمي: ",info: state.teamMemberInfoModel.data!.academic_level!),
                              DashboardMemberInfoItem(dataType: "التخصص الجامعي: ",info: state.teamMemberInfoModel.data!.academic_specialization!),
                              DashboardMemberInfoItem(dataType: "مجال العمل: ",info: state.teamMemberInfoModel.data!.work_specialization!),
                              Row(
                                children: [
                                  Expanded(
                                    child: MaterialButtonComponent(
                                        onPressed: (){
                                          context.read<TeamsBloc>().add(AcceptJoinRequestEvent(joinRequestId));

                                        },
                                        child: Text ("قبول",
                                            style: buttonTextStyle(fontWeight: FontWeight.w900),
                                        )),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: MaterialButtonComponent(
                                        onPressed: (){
                                          context.read<TeamsBloc>().add(RefuseJoinRequestEvent(joinRequestId));

                                        },
                                        child: Text ("رفض",
                                          style: buttonTextStyle(fontWeight: FontWeight.w900),
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                              :
                              state is AcceptJoinRequestErrorState || state is RefuseJoinRequestErrorState?
                          Center(child: Text (
                            "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ", style: Theme.of(context).textTheme.titleMedium,),)
                        :
                                  SizedBox()
                      ),

                    ),
                  );
                }
            )
        )
    );
  }
}
