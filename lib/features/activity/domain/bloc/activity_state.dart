// part of 'profile_bloc.dart';
//
// @immutable
import 'package:saa_f/features/activity/domain/models/get_activity_list_model.dart';

abstract class ActivityState {}
//
class ActivityInitialState extends ActivityState {}
class ActivitySetNewState extends ActivityState {}
class PickMultiPhotoState extends ActivityState {}
class ActivityShowMainImageState extends ActivityState {}
class ActivityAddLoadingState extends ActivityState {}
class ActivityAddSuccessState extends ActivityState {}
class ActivityAddErrorState extends ActivityState {}
class EditActivityLoadingState extends ActivityState {}
class EditActivitySuccessState extends ActivityState {}
class EditActivityErrorState extends ActivityState {}
class GetAnnouncedActivitiesLoadingState extends ActivityState {}
class GetAnnouncedActivitiesSuccessState extends ActivityState {
  final ActivityListModel activityListModel;

  GetAnnouncedActivitiesSuccessState({required this.activityListModel});
}
class GetAnnouncedActivitiesErrorState extends ActivityState {}
class GetConfirmedActivitiesLoadingState extends ActivityState {}
class GetConfirmedActivitiesSuccessState extends ActivityState {
  final ActivityListModel activityListModel;
  GetConfirmedActivitiesSuccessState({required this.activityListModel});
}
class GetConfirmedActivitiesErrorState extends ActivityState {}
class ConfirmActivityLoadingState extends ActivityState {}
class ConfirmActivitySuccessState extends ActivityState {}
class ConfirmActivityErrorState extends ActivityState {}
class DeleteActivityLoadingState extends ActivityState {}
class DeleteActivitySuccessState extends ActivityState {}
class DeleteActivityErrorState extends ActivityState {}
class ShowActivityInfoLoadingState extends ActivityState {}
class ShowActivityInfoSuccessState extends ActivityState {
  final ActivityModel activityModel;

  ShowActivityInfoSuccessState({required this.activityModel});
}
class ShowActivityInfoErrorState extends ActivityState {}
class SetEditValueState extends ActivityState {}
//
// class ActivityAnSuccess extends ActivityState {
//   final AnActivity anActivity;
//
//   ActivityAnSuccess({required this.anActivity});
// }
//
// class ActivityDeleteedSuccess extends ActivityState {
//   final AnActivity activity;
//
//   ActivityConfirmedSuccess({required this.activity});
// }
//
// class ActivityLoadingState extends ActivityState {}
//
// class ActivityErrorState extends ActivityState {
//   final ErrorModel errorModel;
//
//   ActivityErrorState({required this.errorModel});
// }
//
// class AddActivitySuccessState extends ActivityState {}
//
// class AddActivityErrorState extends ActivityState {
//   final ErrorModel errorModel;
//
//   AddActivityErrorState({required this.errorModel});
// }
//
// class AddActivityLoadingState extends ActivityState {}
//
// class DeleteActivitySuccessState extends ActivityState {}
//
// class DeleteActivityErrorState extends ActivityState {
//   final String error;
//
//   DeleteActivityErrorState({required this.error});
// }
//
// class DeleteActivityLoadingState extends ActivityState {}
//
// class JoinActivitySuccessState extends ActivityState {}
//
// class JoinActivityErrorState extends ActivityState {
//   final String error;
//
//   JoinActivityErrorState({required this.error});
// }
//
// class JoinActivityLoadingState extends ActivityState {}
//
// class CancelActivitySuccessState extends ActivityState {}
//
// class CancelActivityErrorState extends ActivityState {
//   final String error;
//
//   CancelActivityErrorState({required this.error});
// }
//
// class CancelActivityLoadingState extends ActivityState {}
//
// class AllMembersActivitySuccessState extends ActivityState {}
//
// class AllMembersActivityErrorState extends ActivityState {
//   final String error;
//
//   AllMembersActivityErrorState({required this.error});
// }
//
// class AllMembersActivityLoadingState extends ActivityState {}
//
// class AllActivityForMemberSuccessState extends ActivityState {
//   final AnActivity allActivityForMember;
//
//   AllActivityForMemberSuccessState({required this.allActivityForMember});
// }
//
// class AllActivityForMemberErrorState extends ActivityState {
//   final String error;
//
//   AllActivityForMemberErrorState({required this.error});
// }
//
// class AllActivityForMemberLoadingState extends ActivityState {}
//
// class DeleteMemberFromActivitySuccessState extends ActivityState {}
//
// class DeleteMemberFromActivityErrorState extends ActivityState {
//   final String error;
//
//   DeleteMemberFromActivityErrorState({required this.error});
// }
//
// class DeleteMemberFromActivityLoadingState extends ActivityState {}
//
// class ConfirmActivitySuccessState extends ActivityState {}
//
// class ConfirmActivityErrorState extends ActivityState {
//   final String error;
//
//   ConfirmActivityErrorState({required this.error});
// }
//
// class ConfirmActivityLoadingState extends ActivityState {}
//
// class EditActivitySuccessState extends ActivityState {}
//
// class EditActivityErrorState extends ActivityState {
//   final ErrorModel errorModel;
//
//   EditActivityErrorState({required this.errorModel});
// }
//
// class EditActivityLoadingState extends ActivityState {}
//
// class GetAdminMemberSuccessState extends ActivityState {}
//
// class GetAdminMemberErrorState extends ActivityState {
//   final String error;
//
//   GetAdminMemberErrorState({required this.error});
// }
//
// class GetAdminMemberLoadingState extends ActivityState {}
//
// class GetResponsibleActivitiesSuccessState extends ActivityState {}
//
// class GetResponsibleActivitiesErrorState extends ActivityState {
//   final String error;
//
//   GetResponsibleActivitiesErrorState({required this.error});
// }
//
// class GetResponsibleActivitiesLoadingState extends ActivityState {}
//
// class GetMyActivitySuccessState extends ActivityState {}
//
// class GetMyErrorState extends ActivityState {
//   final String error;
//
//   GetMyErrorState({required this.error});
// }
//
// class GetMyActivitiesLoadingState extends ActivityState {}
// class PickMultiPhotoState extends ActivityState {}
//
// class InsertImagePickPhotoState extends ActivityState {}
