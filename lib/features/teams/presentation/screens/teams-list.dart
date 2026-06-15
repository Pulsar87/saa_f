import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/assets-const.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/_drawer/presntiaion/widgets/drawer/my_drawer.dart';
import 'package:saa_f/features/auth/presentation/widgets/auth_clipbath.dart';
import 'package:saa_f/features/teams/presentation/screens/add-team/add-team-main-screen.dart';
import 'package:saa_f/features/teams/presentation/screens/teams-main-screen.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/network/local/shared_prefrences_helper.dart';
import '../../../../core/router/animation_route.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/teams-method.dart';
import 'admin-add-team.dart';

class TeamsList extends StatelessWidget {
   TeamsList({super.key});
  final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
               if (state is GetTeamsListErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,"حصل خطأ ما");
              }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if(state is TeamsInitState || state is TeamsRefreshState) {
                    print("TeamsRefreshEvent");
                    context.read<TeamsBloc>().add(GetTeamsListEvent());
                  }
                  return SafeArea(
                    child: Directionality(
                      textDirection: TextDirection.rtl,

                      child: Scaffold(
                        // appBar: AppBar(
                        //   backgroundColor: primaryColor,
                        //   elevation: 0,
                        // ),
                        // drawer: MyDrawer(),
                        // appBar: AppBar(
                        //   title: Text("لائحة الفرق"),
                        // ),

                        floatingActionButton:
                        SharedPreferencesHelper.getData(key: "مدير الجمعية") == "مدير الجمعية"?
                        FloatingActionButton(
                          onPressed: (){
                            Navigator.of(context).push(MyAnimatedRoute(page: AdminAddTeam()))
                                .then((value) =>
                            {
                              context.read<TeamsBloc>().add(TeamsRefreshEvent())
                            }
                            );
                            },

                          child: Icon(Icons.add),
                        ):
                        SizedBox(),
                        body: state is GetTeamsListLoadingState ?
                        MyLoadingScreen()
                            :
                        state is GetTeamsListSuccessState ?

                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ScreenClipPath(imagePath:AssetsConst.img4,h: 3,),
                                  // InkWell(
                                  //     onTap: (){
                                  //
                                  //     },child: Icon(Icons.list,color: Colors.white,size: 25)),

                                ],
                              ),

                              Container(
                                margin: EdgeInsets.all(20),
                                child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context,index) =>
                                        MaterialButtonComponent(
                                        onPressed: (){
                                          Navigator.of(context).push(MyAnimatedRoute(
                                              page:  TeamMainScreen(
                                            id: state.teamListModel.teamList[index]['id'],
                                            teamName: state.teamListModel.teamList[index]['name'],
                                            description: state.teamListModel.teamList[index]['description'],
                                          )
                                          ))
                                              .then((value) =>
                                          {
                                          context.read<TeamsBloc>().add(GetTeamsListEvent())
                                          }
                                          );
                                          print(state.teamListModel.teamList[index]['id']);
                                          print(state.teamListModel.teamList[index]['name']);
                                          },
                                        child: Text(
                                            state.teamListModel.teamList[index]['name'],
                                            style: buttonTextStyle(fontWeight: FontWeight.w900))
                                    ),
                                    separatorBuilder: (context,index)=> SizedBox(),
                                    itemCount: state.teamListModel.teamList.length),
                              ),
                            ],
                          ),
                        )
                        :
                        state is GetTeamsListErrorState ?
                        Center(child: Text (
                          "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ",
                          style: normalTextStyle(),)
                        )
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
