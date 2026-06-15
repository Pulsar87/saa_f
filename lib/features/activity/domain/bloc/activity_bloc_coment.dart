// // import 'dart:async';
// // import 'dart:developer';
// // import 'dart:io';
// // import 'package:bloc/bloc.dart';
// // import 'package:flutter/material.dart';
// // import 'package:meta/meta.dart';
// //
// // import '../../../../core/network/remote/error_model.dart';
// // import '../../data/repository/profile_repo.dart';
// // import '../models/add_activty_model.dart';
// // import '../models/all_member_activity_model.dart';
// // import '../models/an_activites_model.dart';
// // import '../models/member_model.dart';
// // import '../models/my_activity_model.dart';
// // import '../models/responsible_activities_model.dart';
// // import 'profile_event.dart';
// // import 'profile_state.dart';
// //
// // part 'profile_event.dart';
// //
// // part 'profile_state.dart';
// //
// // // class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
// // //   final ActivityRepository activityRepository;
// // //
// // //   ActivityBloc({required this.activityRepository}) : super(ActivityInitial()) {
// // //     on<GetAnActivityEvent>(_getAnActivity);
// // //     on<GetConfirmedActivityEvent>(_getConfirmedActivity);
// // //     on<AddActivityEvent>(_addActivityEvent);
// // //     on<EditActivityEvent>(_editActivityEvent);
// // //     on<DeleteActivityEvent>(_deleteActivityEvent);
// // //     on<GetAdminMemberEvent>(_getAdminMemberEvent);
// // //     on<CancelActivityEvent>(_cancelActivityEvent);
// // //     on<ConfirmActivityEvent>(_confirmActivityEvent);
// // //     on<AllActivityForMemberEvent>(_allActivityForMember);
// // //     on<DeleteMemberFromActivitiesEvent>(_deleteMemberFromActivitiesEvent);
// // //     on<GetAllMembersActivitiesEvent>(_allMembersActivitiesEvent);
// // //     on<JoinActivityEvent>(_getJoinActivityEvent);
// // //     on<GetResponsibleActivitiesEvent>(_getResponsibleActivities);
// // //     on<GetMyActivitiesEvent>(_getMyActivities);
// // //     on<InsertImagePickPhotoEvent>(_showPhoto);
// // //     on<DeleteTextDateEvent>(_deleteTextData);
// // //     on <PickMultiPhotoEvent> (_pickMultiPhoto);
// // //
// // //   }
// // //
// // //   final GlobalKey<FormState> activityKey = GlobalKey<FormState>();
// // //   final GlobalKey<FormState> updateActivityKey = GlobalKey<FormState>();
// // //   final TextEditingController dateController = TextEditingController();
// // //   final TextEditingController descriptionController = TextEditingController();
// // //   final TextEditingController nameController = TextEditingController();
// // //  var selectedDate;
// // //   String type = 'عام';
// // //   final TextEditingController placeController = TextEditingController();
// // //   final TextEditingController ageController = TextEditingController();
// // //   File? photo;
// // //
// // //   MemberModel memberModel = MemberModel();
// // //   int? memberId;
// // //   ResponsibleActivities responsibleActivitiesModel = ResponsibleActivities();
// // //   MyActivityModel myActivityModel = MyActivityModel();
// // //   List<ActivityInfo>? anActivity = [];
// // //   AllMemberActivityModel allMemberActivityModel = AllMemberActivityModel();
// // //
// // //   FutureOr<void> _getAnActivity(
// // //       GetAnActivityEvent event, Emitter<ActivityState> emit) async {
// // //     emit(ActivityLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.getAnActivity();
// // //       if (response is AnActivity) {
// // //         anActivity = response.data;
// // //         emit(ActivityAnSuccess(anActivity: response));
// // //       } else {
// // //         print("eeeeeeee");
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(ActivityErrorState(errorModel: ErrorModel()));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _getConfirmedActivity(
// // //       GetConfirmedActivityEvent event, Emitter<ActivityState> emit) async {
// // //     emit(ActivityLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.getConfirmedActivity();
// // //       if (response is AnActivity) {
// // //         emit(ActivityAnSuccess(anActivity: response));
// // //       } else {
// // //         print("eeeeeeee");
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(ActivityErrorState(errorModel: ErrorModel()));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _getAdminMemberEvent(
// // //       GetAdminMemberEvent event, Emitter<ActivityState> emit) async {
// // //     emit(GetAdminMemberLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.getAdminMember();
// // //
// // //       if (response is MemberModel) {
// // //         print("ccccccccccccccccccccccccccccc");
// // //         print(response.data?.members?.length);
// // //         memberModel = response;
// // //         emit(GetAdminMemberSuccessState());
// // //       } else {
// // //         emit(GetAdminMemberErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(ActivityErrorState(errorModel: ErrorModel()));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _getResponsibleActivities(
// // //       GetResponsibleActivitiesEvent event, Emitter<ActivityState> emit) async {
// // //     emit(GetResponsibleActivitiesLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.getResponsibleActivities();
// // //
// // //       if (response is ResponsibleActivities) {
// // //         responsibleActivitiesModel = response;
// // //         emit(GetResponsibleActivitiesSuccessState());
// // //       } else {
// // //         emit(GetResponsibleActivitiesErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(ActivityErrorState(errorModel: ErrorModel()));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _getMyActivities(
// // //       GetMyActivitiesEvent event, Emitter<ActivityState> emit) async {
// // //     emit(GetMyActivitiesLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.getMyActivities();
// // //
// // //       if (response is MyActivityModel) {
// // //         myActivityModel = response;
// // //         emit(GetMyActivitySuccessState());
// // //       } else {
// // //         emit(GetMyErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(GetMyErrorState(error: "errorrrrrr"));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _showPhoto(
// // //       InsertImagePickPhotoEvent event, Emitter<ActivityState> emit) {
// // //     print("PublishPickPhotoState");
// // //     emit(InsertImagePickPhotoState());
// // //   }
// // //
// // //   FutureOr<void> _addActivityEvent(
// // //       AddActivityEvent event, Emitter<ActivityState> emit) async {
// // //     AddActivityModel activityModel = AddActivityModel(
// // //         imgUrl: "",
// // //         activityName: nameController.text,
// // //         activityDate: dateController.text,
// // //         place: placeController.text,
// // //         age: ageController.text,
// // //         description: descriptionController.text,
// // //         type: type,
// // //         memberId: memberId.toString());
// // //     emit(AddActivityLoadingState());
// // //
// // //     var response = await activityRepository.addActivity(
// // //         activityModel: activityModel, file: photo);
// // //
// // //     if (response == true) {
// // //       emit(AddActivitySuccessState());
// // //     } else {
// // //       emit(AddActivityErrorState(errorModel: ErrorModel(errors: [response])));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _editActivityEvent(
// // //       EditActivityEvent event, Emitter<ActivityState> emit) async {
// // //     AddActivityModel activityModel = AddActivityModel(
// // //         imgUrl: "dddddd",
// // //         activityName: nameController.text,
// // //         activityDate: dateController.text,
// // //         place: placeController.text,
// // //         age: ageController.text,
// // //         description: descriptionController.text,
// // //         type: type,
// // //         memberId: memberId.toString());
// // //     emit(EditActivityLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.editActivity(
// // //           activityModel: activityModel, file: photo, id: event.id.toString());
// // //
// // //       emit(EditActivitySuccessState());
// // //
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(EditActivityErrorState(errorModel: ErrorModel()));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _deleteActivityEvent(
// // //       DeleteActivityEvent event, Emitter<ActivityState> emit) async {
// // //     emit(DeleteActivityLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.deleteActivity(id: event.id);
// // //
// // //       if (response = true) {
// // //         emit(DeleteActivitySuccessState());
// // //       } else {
// // //         emit(DeleteActivityErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(GetMyErrorState(error: "errorrrrrr"));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _getJoinActivityEvent(
// // //       JoinActivityEvent event, Emitter<ActivityState> emit) async {
// // //     emit(JoinActivityLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.joinActivity(id: event.id);
// // //
// // //       if (response == true) {
// // //         emit(JoinActivitySuccessState());
// // //       } else {
// // //         emit(JoinActivityErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(JoinActivityErrorState(error: "errorrrrrr"));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _cancelActivityEvent(
// // //       CancelActivityEvent event, Emitter<ActivityState> emit) async {
// // //     emit(CancelActivityLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.cancelActivity(id: event.id);
// // //
// // //       if (response = true) {
// // //         emit(CancelActivitySuccessState());
// // //       } else {
// // //         emit(CancelActivityErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(CancelActivityErrorState(error: "errorrrrrr"));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _confirmActivityEvent(
// // //       ConfirmActivityEvent event, Emitter<ActivityState> emit) async {
// // //     emit(ConfirmActivityLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.confirmActivity(id: event.id);
// // //
// // //       if (response = true) {
// // //
// // //         emit(ConfirmActivitySuccessState());
// // //       } else {
// // //         emit(ConfirmActivityErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(ConfirmActivityErrorState(error: "errorrrrrr"));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _allMembersActivitiesEvent(
// // //       GetAllMembersActivitiesEvent event, Emitter<ActivityState> emit) async {
// // //     emit(AllMembersActivityLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.allMemberActivity(id: event.id);
// // //
// // //       if (response == AllMemberActivityModel) {
// // //         allMemberActivityModel = response;
// // //         emit(AllMembersActivitySuccessState());
// // //       } else {
// // //         emit(AllMembersActivityErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(AllMembersActivityErrorState(error: "errorrrrrr"));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _deleteMemberFromActivitiesEvent(
// // //       DeleteMemberFromActivitiesEvent event,
// // //       Emitter<ActivityState> emit) async {
// // //     emit(DeleteMemberFromActivityLoadingState());
// // //
// // //     try {
// // //       var response = await activityRepository.removeMember(
// // //           id: event.idActivity, memberId: event.idMember);
// // //
// // //       if (response == true) {
// // //         emit(DeleteMemberFromActivitySuccessState());
// // //       } else {
// // //         emit(DeleteMemberFromActivityErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(DeleteMemberFromActivityErrorState(error: "errorrrrrr"));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _allActivityForMember(
// // //       AllActivityForMemberEvent event, Emitter<ActivityState> emit) async {
// // //     emit(AllActivityForMemberLoadingState());
// // //
// // //     try {
// // //       var response =
// // //           await activityRepository.allActivityForMember(memberId: event.id);
// // //
// // //       if (response == true) {
// // //         emit(AllActivityForMemberSuccessState(allActivityForMember: response));
// // //       } else {
// // //         emit(DeleteMemberFromActivityErrorState(error: "errorrrrrr"));
// // //       }
// // //     } catch (e) {
// // //       log(e.toString());
// // //       emit(DeleteMemberFromActivityErrorState(error: "errorrrrrr"));
// // //     }
// // //   }
// // //
// // //   FutureOr<void> _deleteTextData(DeleteTextDateEvent event, Emitter<ActivityState> emit ) {
// // //
// // //      dateController .clear();
// // //      descriptionController .clear();
// // //      nameController .clear();
// // //     selectedDate=null;
// // //      placeController .clear();
// // //      ageController .clear();
// // //   photo=null;
// // //   }
// // //
// // //   FutureOr<void> _pickMultiPhoto(PickMultiPhotoEvent event, Emitter<ActivityState> emit) {
// // //     emit(PickMultiPhotoState());
// // //     print("PickMultiPhotoState");
// // //   }
// // // }
//
//
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../data/repository/profile_repo.dart';
// import 'profile_event.dart';
// import 'profile_state.dart';
//
// class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
//   final ActivityRepo activityRepository;
//   ActivityBloc({required this.activityRepository}) : super(ActivityInitialState()) {
//     // on<GetAnActivityEvent>(_getAnActivity);
//     // on<GetConfirmedActivityEvent>(_getConfirmedActivity);
//     // on<AddActivityEvent>(_addActivityEvent);
//     // on<EditActivityEvent>(_editActivityEvent);
//     // on<DeleteActivityEvent>(_deleteActivityEvent);
//     // on<GetAdminMemberEvent>(_getAdminMemberEvent);
//     // on<CancelActivityEvent>(_cancelActivityEvent);
//     // on<ConfirmActivityEvent>(_confirmActivityEvent);
//     // on<AllActivityForMemberEvent>(_allActivityForMember);
//     // on<DeleteMemberFromActivitiesEvent>(_deleteMemberFromActivitiesEvent);
//     // on<GetAllMembersActivitiesEvent>(_allMembersActivitiesEvent);
//     // on<JoinActivityEvent>(_getJoinActivityEvent);
//     // on<GetResponsibleActivitiesEvent>(_getResponsibleActivities);
//     // on<GetMyActivitiesEvent>(_getMyActivities);
//     // on<InsertImagePickPhotoEvent>(_showPhoto);
//     // on<DeleteTextDateEvent>(_deleteTextData);
//     // on <PickMultiPhotoEvent> (_pickMultiPhoto);
//
//   }
//
// }
