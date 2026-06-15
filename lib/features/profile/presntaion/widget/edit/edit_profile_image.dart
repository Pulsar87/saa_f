import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import '../../../../../core/constant/app-const.dart';
import '../../../../../core/constant/assets-const.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../domain/bloc/profile_bloc.dart';
import '../../../domain/bloc/profile_event.dart';
import '../../../domain/bloc/profile_state.dart';

class EditProfileLoadImageRow extends StatelessWidget {
  EditProfileLoadImageRow({super.key, required this.img, required this.profileBloc});
  final ProfileBloc profileBloc;
  final String? img;

  @override
  Widget build(BuildContext context) {

    return  photoUploadButton(context);

  }
  Widget photoUploadButton(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(listener: (context, state) {
        }, child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          return AnimatedContainer(
            margin: const EdgeInsets.symmetric(vertical: 30),
            height:  150 ,
            width: 150 ,
            decoration: BoxDecoration(
              color: primaryColor,
                // gradient:  LinearGradient(
                //   colors: [primaryColorLight,primaryColorLight,primaryColorLight,primaryColorLight, primaryColorDark], // الألوان التي تريدها في التدرج
                //   begin: Alignment.topRight, // بداية التدرج من الزاوية العليا اليسرى
                //   end: Alignment.bottomLeft, // نهاية التدرج في الزاوية السفلية اليمنى
                // ),
                // boxShadow: [
                //   const BoxShadow(
                //     color: Colors.grey,
                //     //  spreadRadius: 5,
                //     blurRadius: 5,
                //     // offset: Offset(7, 5), // changes position of shadow
                //   ),
                // ],
                shape: BoxShape.circle,
                // borderRadius: const BorderRadius.all(Radius.circular(50)),
                // borderRadius: BorderRadius.all(Radius.circular(25)),
                border: Border.all(
                  color: primaryColor,
                  width: 2,
                ),
                image:
                profileBloc.newProfileImage != null ?
                DecorationImage(
                    image: FileImage(profileBloc.newProfileImage!),
                    fit: BoxFit.cover
                )
                    :
                img!=null?
                DecorationImage(
                    image: NetworkImage("${AppConst.imgUrl}$img"),
                    fit: BoxFit.cover
                )
                    :
                const DecorationImage(
                    image: AssetImage(AssetsConst.profilePhoto),
                    fit: BoxFit.cover
                )

            ),
            duration: const Duration(seconds: 1),
            child: IconButton(
              onPressed: () {
                _pickImage(context);
              },
              icon: Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.9),
                    border: Border.all(color: primaryColor,width: 2)
                ),
                child: const Icon(Icons.edit,size: 25,weight: 5,)),
            ),

          );
        })));

  }

  Future  _pickImage (BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      profileBloc.newProfileImage = imageTemporary;
      context
          .read<ProfileBloc>()
          .add(EditProfileShowImageEvent());
    }
    on PlatformException catch (e) {
      print ('Failed to pick image : $e');
    }
  }

}
