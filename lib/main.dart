import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sss1/features/auth/presentation/screens/reset-password-screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:saa_f/core/constant/app-const.dart';
import 'package:saa_f/features/_drawer/bloc/drawer_bloc.dart';
import 'package:saa_f/features/_drawer/presntiaion/layout/drawer_layout.dart';
import 'package:saa_f/screens/splash/presintaiton/splash_screen.dart';
import 'core/network/local/shared_prefrences_helper.dart';
import 'core/themes/dark-theme.dart';
import 'core/themes/light-theme.dart';
import 'features/JoinRequest/data/join_repo.dart';
import 'features/JoinRequest/domain/bloc/join_bloc.dart';
import 'features/activity/data/repository/activity_repo.dart';
import 'features/activity/domain/bloc/activity_bloc.dart';
import 'features/auth/data/repository/auth_repo.dart';
import 'features/auth/domain/bloc/auth_bloc.dart';
import 'features/publish/data/repository/publish_repo.dart';
import 'features/publish/domain/bloc/publish-bloc.dart';


Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Bloc.observer = MyBlocObserver();
  await SharedPreferencesHelper.init();
  AppConst.token =SharedPreferencesHelper.getData(key: "accessToken");
  print("Token  ${AppConst.token}");
  print(SharedPreferencesHelper.getData(key: "8"));

  print (SharedPreferencesHelper.getData (key: "مسؤول النشر"));
  print (SharedPreferencesHelper.getData (key: "مسؤول طلبات الانتساب"));

  print (SharedPreferencesHelper.getData (key: "عضو"));
  print (SharedPreferencesHelper.getData (key: "مدير الجمعية"));
  print (SharedPreferencesHelper.getData (key: "عضو مجلس إدارة"));
  // state.loginModel.data?.user?.roles?.forEach((role) =>
  //     print("You have role ${role.name} \n"));

  print (AppConst.token);
  bool first = AppConst.token==null;
  runApp( MyApp(isFirst: first,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirst});
  final bool isFirst;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepo(),
        ),
        // RepositoryProvider(
        //   create: (context) => MemberRepo(),
        // ),
        // RepositoryProvider(
        //   create: (context) => MembershipListRepo(),
        // ),
        // RepositoryProvider(
        //   create: (context) => ProfileRepo(),
        // ),
        RepositoryProvider(
          create: (context) => JoinRepo(),
        ),
        // RepositoryProvider(
        //   create: (context) => UserRepo(),
        // ),
        RepositoryProvider(
          create: (context) => PublishRepo(),
        ),
        // RepositoryProvider(
        //   create: (context) => MembershipListRepo(),
        // ),
        // RepositoryProvider(
        //   create: (context) => DashboardMembershipInfoRepo(),
        // ),
        // RepositoryProvider(
        //   create: (context) => SeparateMemberRepo(),
        // ),
        RepositoryProvider(
          create: (context) => ActivityRepo(),
        ),
        // RepositoryProvider(
        //   create: (context) => ResourcesRepository(),
        // ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(authRepo: context.read<AuthRepo>()),
          ),
          // BlocProvider(
          //   create: (context) => MemberBloc(context.read<MemberRepo>()),
          // ),
          // BlocProvider(
          //   create: (context) => DashboardMembershipListBloc(
          //       membershipListRepo: context.read<MembershipListRepo>()),
          // ),
          // BlocProvider(
          //   create: (context) => DashboardMainBloc(),
          // ),
          // BlocProvider(
          //     create: (context) => DashboardMembershipListBloc(
          //         membershipListRepo: context.read<MembershipListRepo>())),
          // BlocProvider(
          //     create: (context) => DashboardMembershipInfoBloc(
          //         memberInfoRepo: context.read<DashboardMembershipInfoRepo>())),
          // BlocProvider(
          //   create: (context) =>
          //       ProfileBloc(profileRepo: context.read<ProfileRepo>()),
          // ),
          BlocProvider(
            create: (context) => JoinBloc(joinRepo: context.read<JoinRepo>()),
          ),
          BlocProvider(
            create: (context) => DrawerBloc(),),
          // BlocProvider(
          //   create: (context) =>
          //   UserBloc(context.read<UserRepo>())..add(ListUserEvent()),
          // ),
          // BlocProvider(
          //   create: (context) => MemberBloc(context.read<MemberRepo>()),
          // ),
          BlocProvider(
            create: (context) =>
                PublishBloc(publishRepo: context.read<PublishRepo>()),
          ),
          BlocProvider(
            create: (context) => ActivityBloc(
                activityRepository: context.read<ActivityRepo>()),
          ),
          // BlocProvider(
          //   create: (context) =>
          //       SeparateMemberBloc(context.read<SeparateMemberRepo>()),
          // ),
          // BlocProvider(
          //   create: (context) =>
          //   ResourcesBloc(context.read<ResourcesRepository>())
          //     ..add(ListStoreEvent()),
          // )
        ],
        child: MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar'), // Spanish
            ],

            debugShowCheckedModeBanner: false,

            title: 'SAA',
            themeMode: ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            // home: OnboardingScreen()
            // home: HomeLayout()
          home:  SplashScreen (first:isFirst,),
          // home: DrawerLayout(),
          // routes: {
          //   homeRoute: (context) => HomeScreen(),
          //   onBoardRoute: (context) => OnBoardingScreen(),
          //   changeColorRoute: (context) => ChangeColor(),
          //   // tasksRoute: (context) => TasksScreen(name: '', task: [],),
          // },

        ),

        // child: MaterialApp.router(
        //   debugShowCheckedModeBanner: false,
        //   routerConfig: router,
        //   title: 'Flutter Demo',
        //   themeMode: ThemeMode.light,
        //   theme: lightTheme,
        //   darkTheme: darkTheme,
        // ),
      ),
    );
  }
}
