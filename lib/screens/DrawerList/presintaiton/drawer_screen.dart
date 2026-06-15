import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saa_f/core/constant/assets-const.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/activity/presentation/screens/activity-photos.dart';
import 'package:saa_f/features/activity/presentation/screens/add_activity.dart';
import 'package:saa_f/features/activity/presentation/screens/get_announced_activities_screen.dart';
import 'package:saa_f/features/auth/presentation/screens/login.dart';
import 'package:saa_f/features/profile/presntaion/screen/profile%20.dart';
import 'package:saa_f/features/teams/presentation/screens/teams-list.dart';
import '../../../core/constant/app-const.dart';
import '../../../core/network/local/shared_prefrences_helper.dart';
import '../../../core/router/animation_route.dart';
import '../../../core/router/router_name.dart';
import '../../../core/unit/home_list_view.dart';
import '../../../features/JoinRequest/presentation/screen/join-screen.dart';
import '../../../features/publish/presentation/screens/admin-publish/publish-request-layout.dart';
import '../../../features/publish/presentation/screens/gallarey/image-gallery.dart';
import '../../../features/publish/presentation/screens/gallarey/video-gallery.dart';
import '../../about/aboutPage.dart';
import '../../conect_us/conect_us.dart';
import '../../inner_sysetem/inner_system.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),

          child: SingleChildScrollView(
            child: Column(
              children: [
                // ListTile(
                //   onTap: (){
                //     Navigator.of(context).push(MyAnimatedRoute(page: ImageGallery()));
                //
                //   },
                //   leading: Icon(Icons.photo_album_outlined,
                //     color: primaryColor,
                //     size: 40,
                //   ),
                //   title: Text("معرض الصور",
                //     style : normalTextStyle(fontSize: 25)
                //   ),
                // ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MyAnimatedRoute(page: Profile()));

                  },
                  leading: Icon(Icons.person,
                    color: primaryColor,
                    size: 40,
                  ),
                  title: Text("الصفحة الشخصية",
                    style : normalTextStyle(fontSize: 25)
                  ),
                ),
                Divider(thickness: 2),
                // ListTile(
                //   onTap: (){
                //     Navigator.of(context).push(MyAnimatedRoute(page: VideoGallery()));
                //
                //   },
                //   leading: Icon(Icons.video_camera_back_outlined,
                //     color: primaryColor,
                //     size: 40,
                //   ),
                //   title: Text("معرض الفيديو",
                //       style : normalTextStyle(fontSize: 25)
                //   ),
                // ),
                // Divider(thickness: 2),
                if (SharedPreferencesHelper.getData(key: "مسؤول النشر") == "مسؤول النشر")
                //النشر
                  Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(MyAnimatedRoute(page: PublishRequestLayout()));

                        },
                        leading: Icon(Icons.camera,
                          color: primaryColor,
                          size: 40,
                        ),
                        title: Text("طلبات النشر",
                            style : normalTextStyle(fontSize: 25)
                        ),
                      ),
                      Divider(thickness: 2),

                    ],
                  ),
                if (SharedPreferencesHelper.getData(key: "مسؤول الأنشطة") == "مسؤول الأنشطة")
                //الأنشطة
                  Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(MyAnimatedRoute(page: AddActivityScreen()));

                        },
                        leading: Icon(Icons.add_task_rounded,
                          color: primaryColor,
                          size: 40,
                        ),
                        title: Text("إضافة نشاط",
                            style : normalTextStyle(fontSize: 25)
                        ),
                      ),
                      Divider(thickness: 2),

                    ],
                  ),

                if (SharedPreferencesHelper.getData(key: "مسؤول الأنشطة") == "مسؤول الأنشطة")
                //الأنشطة
                  Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(MyAnimatedRoute(page: GetAnnouncedActivitiesScreen()));

                        },
                        leading: Icon(Icons.access_time,
                          color: primaryColor,
                          size: 40,
                        ),
                        title: Text("الأنشطة المعلنة",
                            style : normalTextStyle(fontSize: 25)
                        ),
                      ),
                      Divider(thickness: 2),

                    ],
                  ),

                if (SharedPreferencesHelper.getData(key: "عضو") == "عضو")
                //الفرق
                  Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(MyAnimatedRoute(page: TeamsList()));

                        },
                        leading: Icon(Icons.people,
                          color: primaryColor,
                          size: 40,
                        ),
                        title: Text("الفرق",
                            style : normalTextStyle(fontSize: 25)
                        ),
                      ),
                      Divider(thickness: 2),

                    ],
                  ),
                if (SharedPreferencesHelper.getData(key: "عضو") != "عضو")
                 //انتساب
                  Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(MyAnimatedRoute(page:  JoinScreen()));

                        },
                        leading: Icon(Icons.people_outline,
                          color: primaryColor,
                          size: 40,
                        ),
                        title: Text("طلب انتساب",
                            style : normalTextStyle(fontSize: 25)
                        ),
                      ),
                      Divider(thickness: 2),

                    ],
                  ),

                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MyAnimatedRoute(page: InnerSystem()));
                  },
                  leading: Icon(Icons.document_scanner,color: primaryColor, size: 40,),
                  title: Text("النظام الداخلي",
                      style : normalTextStyle(fontSize: 25)
                  ),
                ),
                Divider(thickness: 2),

                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MyAnimatedRoute(page: AboutPage()));
                  },
                  leading: Container(height: 70,width: 70,child: Image.asset(AssetsConst.logo2)),
                  title: Text("من نحن",
                      style : normalTextStyle(fontSize: 25)
                  ),
                ),
                Divider(thickness: 2),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MyAnimatedRoute(page: ConnectUsPage()));
                  },
                  leading: Icon(Icons.call,color: primaryColor, size: 40,),
                  title: Text("تواصل معنا",
                      style : normalTextStyle(fontSize: 25)
                  ),
                ),
                Divider(thickness: 2),

                ListTile(
                  onTap: (){
                    SharedPreferencesHelper.removeAllData();
                    Navigator.of(context).pushReplacement(MyAnimatedRoute(page: LoginScreen()));

                  },
                  leading: Icon(Icons.logout,
                    color: primaryColor,
                    size: 40,
                  ),
                  title: Text("تسجيل الخروج",
                      style : normalTextStyle(fontSize: 25)
                  ),
                ),
                Divider(thickness: 2),


              ],
            ),
          ),
        ),
      ),
    );
  }
}



final List<ListTileScreen> userDrawerScreens = [
  ListTileScreen(
      title: AppConst.mainScreen, icon: Icons.home, path: homeRoutePath),
  if (SharedPreferencesHelper.getData(key: "2") == 2)
    ListTileScreen(
        title: AppConst.team, icon: Icons.people_outline, path: teamRoutePath),
  if (SharedPreferencesHelper.getData(key: "2") != 2)
    ListTileScreen(
        title: AppConst.gallery, icon: Icons.photo_album, path: joinRoutePath),
  ListTileScreen(
      title: AppConst.shareImage, icon: Icons.image, path: imageGalleryPath),
  ListTileScreen(
      title: AppConst.shareVideo,
      icon: Icons.videocam_outlined,
      path: videoGalleryPath),
  ListTileScreen(
      title: AppConst.activityAn,
      icon: Icons.local_activity_sharp,
      path: anActivityPath),
  ListTileScreen(
      title: AppConst.activityMy,
      icon: Icons.my_library_books_rounded,
      path: myActivitiesPath),
  ListTileScreen(
      title: AppConst.activityAdd, icon: Icons.add, path: addActivityPath),
  ListTileScreen(
      title: AppConst.profile, icon: Icons.person, path: profileRoutePath),
  ListTileScreen(
      title: AppConst.addPost, icon: Icons.photo_camera, path: addPostPath),
  if (SharedPreferencesHelper.getData(key: "10") == 10 ||
      SharedPreferencesHelper.getData(key: "5") == 5)
    ListTileScreen(
        title: AppConst.store, icon: Icons.stop_circle, path: listStorePath),
  if (SharedPreferencesHelper.getData(key: "8") == 8)
    ListTileScreen(
        title: AppConst.req, icon: Icons.camera, path: publishRequestsPath),
  ListTileScreen(
      title: AppConst.about, icon: Icons.area_chart, path: aboutPath),
];
