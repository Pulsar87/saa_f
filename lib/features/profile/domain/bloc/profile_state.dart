// part of 'profile_bloc.dart';
//
// @immutable
import 'package:saa_f/features/activity/domain/models/get_activity_list_model.dart';

import '../models/profile_model.dart';

abstract class ProfileState {}
//
class ProfileInitialState extends ProfileState {}
class ProfileSetState extends ProfileState {}
class ProfileShowProfileLoadingState extends ProfileState {}
class ProfileShowProfileSuccessState extends ProfileState {
  final ProfileModel profileModel;

  ProfileShowProfileSuccessState({required this.profileModel});
}
class ProfileShowProfileErrorState extends ProfileState {}


class EditProfileShowImageState extends ProfileState {}
class ProfileEditLoadingState extends ProfileState {}
class ProfileEditSuccessState extends ProfileState {}
class ProfileEditErrorState extends ProfileState {
  // final List<dynamic> error;
  // ProfileEditErrorState({required this.error});
}

