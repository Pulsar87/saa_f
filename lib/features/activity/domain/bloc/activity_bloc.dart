import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/activity_repo.dart';
import 'activity_event.dart';
import 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepo activityRepository;
  static var addActivityKey = GlobalKey<FormState>();
  var editActivityKey = GlobalKey<FormState>();
  static  List<dynamic> homeActivity = [];
  static  List<dynamic> homeAccounedActivity = [];
  static  List<dynamic> homeConfirmedActivity = [];
  static TextEditingController nameController =  TextEditingController();
  static TextEditingController descriptionController =  TextEditingController();
  static String localAge = "دعوة عامة";
  static File?  mainActivityImage;
  static  TimeOfDay activityTime = const TimeOfDay(hour: 8, minute: 00);
  static  DateTime activityDate = DateTime.now();

  TextEditingController editNameController =  TextEditingController();
  TextEditingController editDescriptionController =  TextEditingController();
  String editLocalAge = "دعوة عامة";
    File?  editMainActivityImage;
   TimeOfDay editActivityTime = const TimeOfDay(hour: 8, minute: 00);
   DateTime editActivityDate = DateTime.now();
   bool isEditDateActivity = false;

  ActivityBloc({required this.activityRepository}) : super(ActivityInitialState()) {
    on<AddActivityShowImageEvent>(_showImage);
    on<AddActivityRequestEvent>(_addActivityRequest);
    on<GetAnnouncedActivitiesEvent>(_getAnnouncedActivities);
    on<ActivitySetStateEvent>(_activitySetState);
    on <PickMultiPhotoEvent> (_pickMultiPhoto);
    on <ActivityConfirmEvent> (_confirmActivity);
    on <DeleteActivityEvent> (_deleteActivity);
    on <ShowActivityInfoEvent> (_showActivityInfo);
    on <GetConfirmedActivitiesEvent> (_getConfirmedActivities);
    on <EditActivityRequestEvent> (_editActivityRequest);
    on <SetEditValueEvent> (_setEditValue);
    on <GetConfirmedAnnouncedEvent> (_getConfirmedAnnounced);

  }



  FutureOr<void> _showImage(AddActivityShowImageEvent event, Emitter<ActivityState> emit)  {
    emit(ActivityShowMainImageState());
  }


  Future<FutureOr<void>> _addActivityRequest(AddActivityRequestEvent event, Emitter<ActivityState> emit) async {
    emit(ActivityAddLoadingState());
    String date = "${activityDate.year}-${activityDate.month.toString()}-${activityDate.day}";
    String time = " ${activityTime.hour}:${activityTime.minute} ${activityTime.period.name} ";
    print(date);
    var response = await activityRepository.addActivity(
      name: nameController.text,
      age: localAge,
      description: descriptionController.text,
      activityImage: mainActivityImage!,
      date: date,
      time: time
    );
    if (response) {
      print("done add activity Success");
      emit(ActivityAddSuccessState());

    } else {
      print("Add activity error");
      emit(ActivityAddErrorState());
      print(response);
    }
  }

  FutureOr<void> _getAnnouncedActivities(GetAnnouncedActivitiesEvent event, Emitter<ActivityState> emit) async {
    emit (GetAnnouncedActivitiesLoadingState());
    try {
      var response = await activityRepository.getAnnouncedActivities();
      if (response.success) {
        print("_get Announced Activities ");
        print("response.data ${response.data}");
        // propertyKitchenAdditionString = turnToStringList(list: response.data);

        emit(GetAnnouncedActivitiesSuccessState(activityListModel: response));

      } else {
        print("_get bed room error");
        print(response);
        emit(GetAnnouncedActivitiesErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetAnnouncedActivitiesErrorState());
    }

  }

  FutureOr<void> _activitySetState(ActivitySetStateEvent event, Emitter<ActivityState> emit) {
    emit(ActivitySetNewState());
  }

  FutureOr<void> _pickMultiPhoto(PickMultiPhotoEvent event, Emitter<ActivityState> emit) {
    emit(PickMultiPhotoState());
    print("PickMultiPhotoState");
  }

  FutureOr<void> _confirmActivity(ActivityConfirmEvent event, Emitter<ActivityState> emit) async {
    emit (ConfirmActivityLoadingState());
    try {
      var response = await activityRepository.confirmActivity(
        id: event.id,
          description: event.description,
          activityImagesList: event.activityFile
      );
      if (response) {
        print("confirm Activity success ");
        emit(ConfirmActivitySuccessState());

      } else {
        print(" confirm Activity error");
        print(response);
        emit(ConfirmActivityErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(ConfirmActivityErrorState());
    }

  }

  FutureOr<void> _deleteActivity(DeleteActivityEvent event, Emitter<ActivityState> emit) async {
    emit (DeleteActivityLoadingState());
    try {
      var response = await activityRepository.deleteActivity(id: event.id,);
      if (response) {
        print("delete Activity success ");
        emit(DeleteActivitySuccessState());
      } else {
        print(" delete Activity error");
        print(response);
        emit(DeleteActivityErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(DeleteActivityErrorState());
    }
  }

  FutureOr<void> _showActivityInfo(ShowActivityInfoEvent event, Emitter<ActivityState> emit) async {
    emit (ShowActivityInfoLoadingState());
    try {
      var response = await activityRepository.showActivity(id: event.id,);
      if (response.success) {
        print("SHOW Activity INFO success ");
        emit(ShowActivityInfoSuccessState(activityModel: response));
      } else {
        print(" SHOW Activity INFO error");
        print(response);
        emit(ShowActivityInfoErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(ShowActivityInfoErrorState());
    }
  }


  FutureOr<void> _getConfirmedActivities(GetConfirmedActivitiesEvent event, Emitter<ActivityState> emit) async {
    emit (GetConfirmedActivitiesLoadingState());
    try {
      var response = await activityRepository.getConfirmActivities();
      if (response.success) {
        print("_get Confirmed Activities ");
        print("response.data ${response.data}");
        // propertyKitchenAdditionString = turnToStringList(list: response.data);

        emit(GetConfirmedActivitiesSuccessState(activityListModel: response));

      } else {
        print("_get Confirmed activity error");
        print(response);
        emit(GetConfirmedActivitiesErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetConfirmedActivitiesErrorState());
    }

  }

  FutureOr<void> _editActivityRequest(EditActivityRequestEvent event, Emitter<ActivityState> emit)
  async {
    emit(EditActivityLoadingState());
    String date = "${editActivityDate.year}-${editActivityDate.month}-${editActivityDate.day} ${editActivityTime.hour}:${editActivityTime.minute}";
    // print(date);
    var response = await activityRepository.editActivity(
      id: event.id,
        name: editNameController.text,
        age: editLocalAge,
        description: editDescriptionController.text,
        activityImage: editMainActivityImage != null ? editMainActivityImage! : File("path") ,
        date: isEditDateActivity? date : ""
    );
    if (response) {
      print("done EDIT activity Success");
      emit(EditActivitySuccessState());

    } else {
      print("EDIT activity error");
      emit(EditActivityErrorState());
      print(response);
    }
  }

  FutureOr<void> _setEditValue(SetEditValueEvent event, Emitter<ActivityState> emit) {
    emit(SetEditValueState());
  }

  FutureOr<void> _getConfirmedAnnounced(GetConfirmedAnnouncedEvent event, Emitter<ActivityState> emit)async {
    emit (GetAnnouncedActivitiesLoadingState());
    try {
      var response = await activityRepository.getAnnouncedActivities();
      if (response.success) {
        print("_get Announced Activities success");
        print("response.data ${response.data}");
        // propertyKitchenAdditionString = turnToStringList(list: response.data);
        emit(GetAnnouncedActivitiesSuccessState(activityListModel: response));
        // emit(GetConfirmedActivitiesSuccessState(activityListModel: response));

      } else {
        print("_get Announced activity error");
        print(response);
        emit(GetAnnouncedActivitiesErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetAnnouncedActivitiesErrorState());
    }

  }
}


