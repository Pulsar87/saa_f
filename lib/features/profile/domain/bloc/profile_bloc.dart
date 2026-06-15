import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/profile/data/repository/profile_repo.dart';
import 'package:saa_f/features/profile/domain/bloc/profile_event.dart';
import 'package:saa_f/features/profile/domain/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;
  static Map<String,dynamic> profileData = {};
  File? newProfileImage;
  final TextEditingController nameController = TextEditingController();
  var editFormKey = GlobalKey<FormState>();

  ProfileBloc({required this.profileRepo}) : super(ProfileInitialState()) {
    on <ProfileShowEvent> (_profileShow);
    on<EditProfileShowImageEvent>(_showImage);
    on<ProfileEditEvent>(_editProfile);
    on<ProfileSetStateEvent>(_profileSetState);

  }


  FutureOr<void> _profileShow(ProfileShowEvent event, Emitter<ProfileState> emit) async {
    emit (ProfileShowProfileLoadingState());
    try {
      var response = await profileRepo.profileShow();
      if (response.success) {
        print("_get profile");
        print("response.data ${response.data}");
        // propertyKitchenAdditionString = turnToStringList(list: response.data);

        emit(ProfileShowProfileSuccessState(profileModel: response));

      } else {
        print("_getPROFILE error");
        print(response);
        emit(ProfileShowProfileErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(ProfileShowProfileErrorState());
    }

  }

  FutureOr<void> _showImage(EditProfileShowImageEvent event, Emitter<ProfileState> emit) {
    emit(EditProfileShowImageState());
  }

  FutureOr<void> _editProfile(ProfileEditEvent event, Emitter<ProfileState> emit)async {

    emit (ProfileEditLoadingState());
    try {
      var response = await profileRepo.profileEdit(
          name: event.name,
          img_: event.image,
      );
      if (response is bool) {
        print("profile edit Success");
        emit(ProfileEditSuccessState());

      } else {
        print("profile edit error");
        print(response);
        emit(ProfileEditErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(ProfileEditErrorState());
    }
  }


  FutureOr<void> _profileSetState(ProfileSetStateEvent event, Emitter<ProfileState> emit) {
    emit(ProfileSetState());
  }
}


