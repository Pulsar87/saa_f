// part of 'profile_bloc.dart';
//
// @immutable
import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ProfileEvent {}

class ProfileShowEvent extends ProfileEvent{}
class ProfileSetStateEvent extends ProfileEvent{}

class EditProfileShowImageEvent extends ProfileEvent {}
class ProfileEditEvent extends ProfileEvent {
  final String name;
  final File image;

  ProfileEditEvent({required this.name, required this.image});
}
