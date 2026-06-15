// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../../features/-dashboard/dashboard-main-screen/presntation/screen/dashboard-main-screen.dart';
// import '../../features/JoinRequest/presentation/screen/join-screen.dart';
// import '../../features/JoinRequest/presentation/screen/rules-screen.dart';
// import '../../features/auth/presentation/screens/reset-password-screen.dart';
// import '../../features/auth/presentation/screens/signup_verification_code.dart';
// import '../../features/profile/presentation/screen/edit-profile-screen.dart';
// import '../../features/profile/presentation/screen/profile-screen.dart';
// import '../../features/publish/presentation/screens/admin-publish/publish-request-layout.dart';
// import '../../features/publish/presentation/screens/admin-publish/show-aricle-publish-requests.dart';
// import '../../features/publish/presentation/screens/admin-publish/show-image-publish-requests.dart';
// import '../../features/publish/presentation/screens/admin-publish/show-viedo-publish-requests.dart';
// import '../../features/publish/presentation/screens/article/user-add-article/add-post.dart';
// import '../../features/publish/presentation/screens/gallarey/image-gallery.dart';
// import '../../features/publish/presentation/screens/gallarey/video-gallery.dart';
// import '../../features/publish/presentation/screens/post-list.dart';
// import '../../features/publish/presentation/screens/user-publish/insert-image-screen.dart';
// import '../../features/publish/presentation/screens/user-publish/insert-viedo-screen.dart';
// import '../../features/resources/presention/screens/resources_screen.dart';
// import '../../features/splash-welcome/presentation/screen/home-screen.dart';
// import '../../features/splash-welcome/presentation/screen/splash-screen.dart';
// import '../../features/splash-welcome/presentation/screen/welcome-screen.dart';
// import '../../features/teams/presentation/screens/team-member-screen.dart';
// import '../../features/teams/presentation/screens/teams-list.dart';
//
// final GoRouter router = GoRouter(
//     initialLocation: homeRoutePath,
//     // initialLocation: joinRoutePath,
//     // initialLocation: "/test",
//     // initialLocation: homeRoutePath,
//     // initialLocation: dashboardMainScreenPath,
//     // initialLocation: publishRequestsPath,
//     routes: <RouteBase>[
//       // initialLocation: anActivityPath,
//       // initialLocation: listStorePath,
//
//       // initialLocation: allUserActivitiesPath,
//       // initialLocation: homeRoutePath,
//       ///////////////////Resources///////////////
//       GoRoute(
//         path: "/test",
//         name: "test",
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: VerificationCodeScreen());
//           //     TeamMemberScreen(teamId: 7,));
//           // )
//           // ;
//         },
//       ),
//
//       GoRoute(
//         path: addResourcesPath,
//         name: addResourcesName,
//         builder: (BuildContext context, GoRouterState state) {
//           ResourceCategoriesEnum type = state.extra as ResourceCategoriesEnum;
//           return AddResourcesScreen(
//             resourceCategories: type,
//           );
//         },
//       ),
//       GoRoute(
//         path: resourcesPath,
//         name: resourcesName,
//         builder: (BuildContext context, GoRouterState state) {
//           ResourceCategoriesEnum type = state.extra as ResourceCategoriesEnum;
//           return ResourcesScreen(
//             resourceCategories: type,
//           );
//         },
//       ),
//       GoRoute(
//         path: resourcesCategoryPath,
//         name: resourcesCategoryName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const ResourcesCategoryScreen();
//         },
//       ),
//       GoRoute(
//         path: listStorePath,
//         name: listStoreName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const ListStoreScreen();
//         },
//       ),
//
//       //////////////////////////////////////
//       GoRoute(
//         path: addPostPath,
//         name: addPostName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: AddPost());
//         },
//       ),
//       GoRoute(
//         path: loginRoutePath,
//         name: loginRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: LoginScreen());
//         },
//       ),
//       GoRoute(
//         path: loginDashboardRoutePath,
//         name: loginDashboardRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return DashboardLoginScreen();
//         },
//       ),
//       GoRoute(
//         path: sinUpRoutePath,
//         name: sinUpRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return SinupScreen();
//         },
//       ),
//       GoRoute(
//         path: splashRoutePath,
//         name: splashRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const SplashScreen();
//         },
//       ),
//       GoRoute(
//         path: welcomeRoutePath,
//         name: welcomeRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const WelcomeScreen();
//         },
//       ),
//       GoRoute(
//         path: joinRoutePath,
//         name: joinRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const JoinScreen();
//         },
//       ),
//       GoRoute(
//         path: editProfileRoutePath,
//         name: editProfileRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           ProfileModel profileModel = state.extra as ProfileModel;
//           return EditProfileScreen(
//             profileModel: profileModel,
//           );
//         },
//       ),
//       GoRoute(
//         path: homeRoutePath,
//         name: homeRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const HomeScreen();
//         },
//       ),
//       GoRoute(
//         path: profileRoutePath,
//         name: profileRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const ProfileScreen();
//         },
//       ),
//       GoRoute(
//         path: verificationCodeRoutePath,
//         name: verificationCodeRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const VerificationCodeScreen();
//         },
//       ),
//       GoRoute(
//         path: userInfoRoutePath,
//         name: userInfoRouteName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const RulesScreen();
//         },
//       ),
//       GoRoute(
//         path: enterEmailScreenPath,
//         name: enterEmailScreenName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: EnterEmailScreen());
//         },
//       ),
//       GoRoute(
//         path: resetPasswordPath,
//         name: resetPasswordName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: ResetPasswordScreen());
//         },
//       ),
//       GoRoute(
//         path: dashboardMainScreenPath,
//         name: dashboardMainScreenName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.ltr, child: DashboardMainScreen());
//         },
//       ),
//       GoRoute(
//         path: resetPath,
//         name: resetName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const ResetScreen();
//         },
//       ),
//
//       GoRoute(
//         path: userUploadPhotoPath,
//         name: userUploadPhotoName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: InsertImageScreen());
//         },
//       ),
//       GoRoute(
//         path: userUploadVideoPath,
//         name: userUploadVideoName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: InsertVideoScreen());
//         },
//       ),
//       GoRoute(
//         path: publishRequestsPath,
//         name: publishRequestsName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: PublishRequestLayout());
//         },
//       ),
//       GoRoute(
//         path: articleRequestsPath,
//         name: articleRequestsName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl,
//               child: ShowArticlePublishRequests());
//         },
//       ),
//       GoRoute(
//         path: imageRequestsPath,
//         name: imageRequestsName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl,
//               child: ShowImagePublishRequests());
//         },
//       ),
//       GoRoute(
//         path: videoRequestsPath,
//         name: videoRequestsName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl,
//               child: ShowVideoPublishRequests());
//         },
//       ),
//
//       // GoRoute(
//       //   path: galleryLayoutPath,
//       //   name: galleryLayoutName,
//       //   builder: (BuildContext context, GoRouterState state) {
//       //     return Directionality(textDirection: TextDirection.rtl,child: GalleryLayout());
//       //   },
//       // ),
//       GoRoute(
//         path: imageGalleryPath,
//         name: imageGalleryName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: ImageGallery());
//         },
//       ),
//       GoRoute(
//         path: videoGalleryPath,
//         name: videoGalleryName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: VideoGallery());
//         },
//       ),
//       GoRoute(
//         path: postListPath,
//         name: postListName,
//         builder: (BuildContext context, GoRouterState state) {
//           return Directionality(
//               textDirection: TextDirection.rtl, child: PostList());
//         },
//       ),
//       GoRoute(
//         path: addActivityPath,
//         name: activityName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const AddActivityScreen();
//         },
//       ),
//       GoRoute(
//         path: anActivityPath,
//         name: anActivityName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const AnActivityScreen();
//         },
//       ),
//       GoRoute(
//         path: confirmedActivityPath,
//         name: confirmedActivityName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const ConfirmedActivityScreen();
//         },
//       ),
//       GoRoute(
//         path: responsibleActivitiesPath,
//         name: responsibleActivitiesName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const ResponsibleActivitiesScreen();
//         },
//       ),
//       GoRoute(
//         path: myActivitiesPath,
//         name: myActivitiesName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const MyActivityScreen();
//         },
//       ),
//       GoRoute(
//         path: allUserActivitiesPath,
//         name: allUserActivitiesName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const AllMemberActivityScreen();
//         },
//       ),
//       GoRoute(
//         path: aboutPath,
//         // name: allUserActivitiesName,
//         builder: (BuildContext context, GoRouterState state) {
//           return const AboutPage();
//         },
//       ),
//       GoRoute(
//         path: teamRoutePath,
//         // name: teamRoutePath,
//         builder: (BuildContext context, GoRouterState state) {
//           return TeamsList();
//         },
//       ),
//       GoRoute(
//         path: addTeamRoutePath,
//         // name: teamRoutePath,
//         builder: (BuildContext context, GoRouterState state) {
//           return AdminAddTeam();
//         },
//       ),
//     ]);
