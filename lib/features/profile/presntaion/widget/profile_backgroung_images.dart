import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/profile/presntaion/widget/profile_show_edit_dialog.dart';

import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/colors/light-colors.dart';
import '../../../../core/router/animation_route.dart';
import '../../domain/bloc/profile_bloc.dart';
import '../../domain/bloc/profile_event.dart';
import '../screen/edit_profile.dart';

class ProfileBackgroundImages extends StatelessWidget {
  const ProfileBackgroundImages({
    super.key, required this.name, required this.image,
  });

  final String name;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70.0),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: 160,
            color: Colors.grey,
            width: double.infinity,
            child: Image(image:
            AssetImage(AssetsConst.profileBackground),fit: BoxFit.cover),
          ),
          InkWell(
            onTap: () async {
           await   Navigator.of(context).push(MyAnimatedRoute(page:  EditProfileScreen(
                name: name,
                image: image,

              )));
              // showEditDialog(context);
           context.read<ProfileBloc>().add(ProfileSetStateEvent());

            },
            child: Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: primaryColor,width: 2)
                ),
                child: Icon(Icons.edit,color: primaryColor,size: 30,)),
          )
        ],
      ),
    );
  }
}
