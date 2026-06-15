// part of 'profile_bloc.dart';
//
// @immutable
import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ActivityEvent {}
//
// class GetAnActivityEvent extends ActivityEvent {}
//
// class GetConfirmedActivityEvent extends ActivityEvent {}
//
// class AddActivityEvent extends ActivityEvent {}
//
// class DeleteActivityEvent extends ActivityEvent {
//   final String id;
//
//   DeleteActivityEvent({required this.id});
// }
//
// class JoinActivityEvent extends ActivityEvent {
//   final String id;
//
//   JoinActivityEvent({required this.id});
// }
//
// class ConfirmActivityEvent extends ActivityEvent {
//   final String id;
//
//   ConfirmActivityEvent({required this.id});
// }
//
// class EditActivityEvent extends ActivityEvent {
//   final String id;
//
//   EditActivityEvent({required this.id});
// }
//
// class CancelActivityEvent extends ActivityEvent {
//   final String id;
//
//   CancelActivityEvent({required this.id});
// }
//
// class GetAdminMemberEvent extends ActivityEvent {}
//
// class GetResponsibleActivitiesEvent extends ActivityEvent {}
//
// class GetMyActivitiesEvent extends ActivityEvent {}
//
// class AllActivityForMemberEvent extends ActivityEvent {
//   final String id;
//
//   AllActivityForMemberEvent({required this.id});
// }
//
// class DeleteMemberFromActivitiesEvent extends ActivityEvent {
//   final String idMember;
//   final String idActivity;
//
//   DeleteMemberFromActivitiesEvent(
//       {required this.idMember, required this.idActivity});
// }
//
// class GetAllMembersActivitiesEvent extends ActivityEvent {
//   final String id;
//
//   GetAllMembersActivitiesEvent({required this.id});
// }
//
// class InsertImagePickPhotoEvent extends ActivityEvent {}
class PickMultiPhotoEvent extends ActivityEvent {}
class AddActivityShowImageEvent extends ActivityEvent {}
class AddActivityRequestEvent extends ActivityEvent {}
class EditActivityRequestEvent extends ActivityEvent {
  final int id;

  EditActivityRequestEvent({required this.id});

}
class GetAnnouncedActivitiesEvent extends ActivityEvent {}
class GetConfirmedActivitiesEvent extends ActivityEvent {}
class GetConfirmedAnnouncedEvent extends ActivityEvent {}
class ActivitySetStateEvent extends ActivityEvent {}
class ActivityConfirmEvent extends ActivityEvent {
  final List <XFile> activityFile;
  final int id;
  final String description;

  ActivityConfirmEvent({required this.activityFile, required this.id, required this.description});
}
class DeleteActivityEvent extends ActivityEvent {
  final int id;

  DeleteActivityEvent({required this.id});
}
class ShowActivityInfoEvent extends ActivityEvent {
  final int id;

  ShowActivityInfoEvent({required this.id});
}
class SetEditValueEvent extends ActivityEvent {}
//
// class DeleteTextDateEvent extends ActivityEvent{}