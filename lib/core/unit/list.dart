import 'package:flutter/material.dart';
import '../constant/app-const.dart';
import '../network/local/shared_prefrences_helper.dart';
import '../router/router_name.dart';
import 'enum.dart';
import 'home_list_view.dart';

final List<String> availableLanguages = [
  "English",
  "Spanish",
  "French",
  "German",
  "Russian",
  "Hindi",
  "Bengali",
  "Persian",
  "Greek",
  "Italian",
  "Portuguese",
  "Dutch",
  "Swedish",
  "Norwegian",
  "Danish",
  "Icelandic",
  "Chinese",
  "Burmese",
  "Arabic",
  "Hebrew",
  "Amharic",
  "Somali",
  "Indonesian",
  "Korean",
  "Japanese",
  "Turkish",
  "Mongolian",
  "Finnish",
  "Estonian",
  "Vietnamese",
  "Thai",
  "Kurdish",
  "Armenian"
];
final List<String> availableFavorite = [
  "تاريخ علم الفلك",
  "رصد سماء الليل",
  "الخسوف والكسوف",
  "رصد الشهب",
  "المجموعة الشمسية",
  "النجوم والمجرات",
  "بداية ونهاية الكون",
  "الفيزياء الفلكية"
];
final List<String> city = [
  "ريف دمشق",
  "القنيطرة",
  "درعا",
  "السويداء",
  "إدلب",
  "الحسكة",
  "الرقة",
  "دير الزور",
  "طرطوس",
  "اللاذقية",
  "حمص",
  "حماة",
  "حلب",
  "دمشق"
];
final List<String> type = ["عام", "خاص"];
final List<String> activityStat = ["معلن", "مثبت", "ملغى"];
//this is for show to user
List<String> showAcademicStrings(Academic? academic) {
  return [
    "أساسي",
    "ثانوي",
    "جامعي",
    "ماجستير",
    "دكتوراة",
  ];
}

List<String> showLevelStrings(Level? level) {
  return ["مبتدئ", "متوسط", "متقدم", "متخصص"];
}

List<String> ages =[
  'ست سنوات',
  '6-9 سنوات',
  '10-12 سنة',
  '13-15 سنة',
  '16 -18 سنة',
  'دعوة عامة'
];


List<String> showActivityStrings(Activity? activity) {
  return ["علم الفلك النظري", "الرصد الفلكي"];
}

//this is for use in bloc
String getAcademicString(Academic? academic) {
  switch (academic) {
    case Academic.basic:
      return 'أساسي';
    case Academic.secondary:
      return 'ثانوي';
    case Academic.university:
      return 'جامعي';
    case Academic.master:
      return 'ماجستير';
    case Academic.doctorate:
      return 'دكتوراة';
    default:
      return '';
  }
}

String getLevelString(Level level) {
  switch (level) {
    case Level.basic:
      return 'مبتدئ';
    case Level.middle:
      return 'متوسط';
    case Level.advanced:
      return 'متقدم';
    case Level.specialist:
      return 'متخصص';
    default:
      return '';
  }
}

String getActivityString(Activity? activity) {
  switch (activity) {
    case Activity.astronomy:
      return 'علم الفلك النظري';
    case Activity.monitoring:
      return 'الرصد الفلكي';
    default:
      return '';
  }
}

final List<ListTileScreen> userDrawerScreens = [
  ListTileScreen(
      title: AppConst.mainScreen, icon: Icons.home, path: homeRoutePath),
  // if (SharedPreferencesHelper.getData(key: "2") == 2)
    ListTileScreen(
        title: AppConst.team, icon: Icons.people_outline, path: teamRoutePath),
  // if (SharedPreferencesHelper.getData(key: "2") != 2)
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
  // if (SharedPreferencesHelper.getData(key: "10") == 10 ||
  //     SharedPreferencesHelper.getData(key: "5") == 5)
    ListTileScreen(
        title: AppConst.store, icon: Icons.stop_circle, path: listStorePath),
  // if (SharedPreferencesHelper.getData(key: "8") == 8)
    ListTileScreen(
        title: AppConst.req, icon: Icons.camera, path: publishRequestsPath),
  ListTileScreen(
      title: AppConst.about, icon: Icons.area_chart, path: aboutPath),
];
