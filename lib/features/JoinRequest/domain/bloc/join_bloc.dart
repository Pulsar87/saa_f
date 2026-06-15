import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/unit/enum.dart';
import '../../../../core/unit/list.dart';
import '../../../auth/domain/models/singup_successfully_model.dart';
import '../../data/join_repo.dart';
part 'join_event.dart';
part 'join_state.dart';

class JoinBloc extends Bloc<JoinEvent, JoinState> {
  final JoinRepo joinRepo;

  JoinBloc({required this.joinRepo}) : super(JoinInitialState()) {
    on<JoinRequestEvent>(_joinRequest);
  }

  final TextEditingController nameArabicController = TextEditingController();
  final TextEditingController nameEnglishController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  DateTime? selectedDate;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController phoneWhatsappNumberController =
      TextEditingController();
  String city = 'دمشق';

  Academic? selectedAcademic = Academic.basic;
  final TextEditingController academicSpecializationController =
      TextEditingController();
  final TextEditingController workSpecializationController =
      TextEditingController();
  List<String> selectedLanguages = [];

  Level selectedLevel = Level.basic;
  Activity selectedActivity = Activity.astronomy;
  List<String> selectedFavorite = [];
  final TextEditingController progressController = TextEditingController();
  final TextEditingController interestsController = TextEditingController();

  String? email;
  final GlobalKey<FormState> firstKey = GlobalKey<FormState>();
  final GlobalKey<FormState> secondKey = GlobalKey<FormState>();
  final GlobalKey<FormState> thirdKey = GlobalKey<FormState>();
  final GlobalKey<FormState> fourthKey = GlobalKey<FormState>();
  final GlobalKey<FormState> languageKey = GlobalKey<FormState>();
  final GlobalKey<FormState> favoriteKey = GlobalKey<FormState>();

  FutureOr<void> _joinRequest(JoinEvent event, Emitter<JoinState> emit) async {
    log("loading-------------------------");

    emit(JoinLoadingState());
    try {
      log("bloc--------before model------------------------");

      // joinRequestModel: JoinRequestModel(
      //     arabicName: nameArabicController.text,
      //     englishName: nameEnglishController.text,
      //     fatherName: fatherController.text,
      //     BirthDate: birthdayController.text,
      //     nationality: nationalityController.text,
      //     phoneNumber: phoneNumberController.text,
      //     whatsappNumber: phoneWhatsappNumberController.text,
      //     City: city,
      //     academicSpecialization: academicSpecializationController.text,
      //     workSpecialization: workSpecializationController.text,
      //     languageMembers: selectedLanguages.toList(),
      //     academicLevel: getAcademicString(selectedAcademic),
      //     target: progressController.text,
      //     otherInterests: interestsController.text,
      //     activityType: getActivityString(selectedActivity),
      //     astronomyLevel: getLevelString(selectedLevel),
      //     domainMembers: selectedFavorite.toList())
      Map<String, dynamic> data = {
        "arabic_name": nameArabicController.text,
        "english_name": nameEnglishController.text,
        "father_name": fatherController.text,
        "BirthDate": birthdayController.text,
        "City": city,
        "nationality": nationalityController.text,
        "phone_number": phoneNumberController.text,
        "whatsapp_number": phoneWhatsappNumberController.text,
        "email": email,
        "academic_level": getAcademicString(selectedAcademic),
        "academic_specialization": academicSpecializationController.text,
        "work_specialization": workSpecializationController.text,
        "astronomy_level": getLevelString(selectedLevel),
        "activity_type": getActivityString(selectedActivity),
        "target": progressController.text,
        "other_interests": interestsController.text,
        // "language_members": selectedLanguages,
        // "domain_members": ["رصد الشهب", "تاريخ علم الفلك"]
      };
      print('--------------------------------------');

      for (int i = 0; i < selectedLanguages.length; i++) {
        data.addAll({"language_members[$i]": selectedLanguages[i]});
      }
      for (int i = 0; i < selectedFavorite.length; i++) {
        data.addAll({"domain_members[$i]": selectedFavorite[i]});
      }
      print('--------------------------------------');

      print(data);
      print('--------------------------------------');

      log(data.toString());

      var response = await joinRepo.addJoinRequest(data: data);

      log("bloc--------after model------------------------");

      if (response == "true") {
        emit(JoinRequestSuccessState());
      } else {
        emit(JoinRequestErrorState(error: response));
      }
    } catch (e) {
      log(e.toString() + "--------------");
    }
  }
}
