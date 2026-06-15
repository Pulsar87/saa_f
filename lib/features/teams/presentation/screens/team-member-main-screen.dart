import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/network/local/shared_prefrences_helper.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/components/dashboard-member-infoItem.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/add-rating-dialog.dart';
import '../widgets/delete-member-dialog.dart';
import '../widgets/set-leader-dialog.dart';

class TeamMemberMainScreen extends StatelessWidget {
  TeamMemberMainScreen({super.key, required this.memberId, required this.teamId, required this.roleInTeam, required this.meIsTeamLeader, required this.meIsSupervisor});
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());
  final int memberId;
  final int teamId;
  final String roleInTeam;
  final bool meIsTeamLeader;
  final bool meIsSupervisor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if(state is TeamsInitState) {
                    context.read<TeamsBloc>().add(ShowMemberInfoJoinEvent(memberId));

                  }

                  return SafeArea(child: Scaffold(
                    appBar: AppBar(
                      title: Text("معلومات العضو"),
                    ),
                    body: Container(
                      margin: EdgeInsets.all(20),
                        child:
                        state is ShowMemberInfoJoinLoadingState ?
                        Center(child: CircularProgressIndicator())
                            :
                        state is ShowMemberInfoJointSuccessState ?
                        SingleChildScrollView(
                          child: Column(
                          children: [
                            if(roleInTeam == "قائد الفريق")
                            DashboardMemberInfoItem(dataType: "قائد الفريق ",info: "",),
                            if(roleInTeam == "مشرف الفريق")
                            DashboardMemberInfoItem(dataType: "مشرف الفريق ",info: "",),
                            DashboardMemberInfoItem(dataType: "الاسم بالعربية: ",info: state.teamMemberInfoModel.data!.arabic_name!),
                            DashboardMemberInfoItem(dataType: "الاسم بالإنكليزية: ",info: state.teamMemberInfoModel.data!.english_name!),
                            DashboardMemberInfoItem(dataType: "البريد الإلكتروني: ",info: state.teamMemberInfoModel.data!.email!),
                            DashboardMemberInfoItem(dataType: "تاريخ الميلاد: ",info: state.teamMemberInfoModel.data!.BirthDate?? "no"),
                            DashboardMemberInfoItem(dataType: "المدينة: ",info: state.teamMemberInfoModel.data!.City!),
                            DashboardMemberInfoItem(dataType: "رقم الهاتف: ",info: state.teamMemberInfoModel.data!.phone_number!),
                            DashboardMemberInfoItem(dataType: "رقم واتساب: ",info: state.teamMemberInfoModel.data!.whatsapp_number!),
                            DashboardMemberInfoItem(dataType: "المستوى العلمي: ",info: state.teamMemberInfoModel.data!.academic_level!),
                            DashboardMemberInfoItem(dataType: "التخصص الجامعي: ",info: state.teamMemberInfoModel.data!.academic_specialization!),
                            DashboardMemberInfoItem(dataType: "مجال العمل: ",info: state.teamMemberInfoModel.data!.work_specialization!),
                            SizedBox(height: 5,),
                            memberId != SharedPreferencesHelper.getData(key: "userId") &&
                            ! (
                                    (meIsSupervisor && roleInTeam =="مشرف الفريق")
                                        ||
                                        (meIsTeamLeader && (roleInTeam=="قائد الفريق")
                                            ||
                                            (meIsTeamLeader && roleInTeam=="مشرف الفريق")
                                        )
                                )?
                              //حذف عضو
                              MaterialButtonComponent(
                              onPressed: (){
                                showDialog(context: context,
                                  builder: (BuildContext context) {
                                    return DeleteMemberDialog(memberId: memberId, teamId: teamId,);
                                  },
                                );
                              },
                              child:
                              Text("حذف العضو",
                              style: buttonTextStyle(fontWeight: FontWeight.w900),
                              ),
                            )
                                : SizedBox(),

                            //تعيين قائد

                            if (memberId != SharedPreferencesHelper.getData(key: "userId") && (roleInTeam != "قائد الفريق" && meIsSupervisor))
                              MaterialButtonComponent(
                              // verticalPadding: 0,
                              verticalMargin: 0,
                              onPressed: (){
                                showDialog(context: context,
                                  builder: (BuildContext context) {
                                    return SetLeader(memberId: memberId, teamId: teamId,);
                                  },
                                );
                              },
                              child:Text("تعيين كقائد",
                                style: buttonTextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),

                            //تقييم
                            memberId != SharedPreferencesHelper.getData(key: "userId") &&
                                ! (
                                    (meIsSupervisor && roleInTeam =="مشرف الفريق")
                                        ||
                                        (meIsTeamLeader && (roleInTeam=="قائد الفريق")
                                            ||
                                            (meIsTeamLeader && roleInTeam=="مشرف الفريق")
                                        )
                                )?
                              MaterialButtonComponent(
                              onPressed: (){
                                showDialog(context: context,
                                  builder: (BuildContext context) {
                                    return AddRating(memberId: memberId, teamId: teamId,);
                                  },
                                );
                              },
                              child:Text("إضافة تقييم",
                                style: buttonTextStyle(fontWeight: FontWeight.w900),

                              ),
                            )
                                : SizedBox()
                          ],
                      ),
                        )
                            :
                            state is ShowMemberInfoJointErrorState?
                        Center(child: Text (
                    "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ",
                          style: normalTextStyle(),),)
                 :
                                SizedBox()
                  )

                  ),
                  );

                }
            )
        )
    );

  }
}
