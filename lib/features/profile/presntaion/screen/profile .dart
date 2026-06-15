import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/features/profile/data/repository/profile_repo.dart';
import 'package:saa_f/features/profile/domain/bloc/profile_event.dart';
import 'package:saa_f/features/profile/domain/bloc/profile_state.dart';
import 'package:saa_f/features/profile/presntaion/widget/profile_data.dart';
import 'package:saa_f/features/publish/presentation/screens/article/user-add-article/add-post.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/themes/text_style.dart';
import '../../domain/bloc/profile_bloc.dart';
import '../widget/profile_avatar.dart';
import '../widget/profile_backgroung_images.dart';
import '../widget/profile_send_join_request.dart';
import '../widget/shimmer_container.dart';

class Profile extends StatelessWidget {
   Profile({super.key});
  ProfileBloc profileBloc = ProfileBloc(profileRepo: ProfileRepo());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              print(state);
              if (state is ProfileShowProfileSuccessState) {
                // PublishBloc.imageGalleryCategory = state.category;
                ProfileBloc.profileData.clear();
                ProfileBloc.profileData.addAll(state.profileModel.data!);
              }
            }, child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
              if (state is ProfileInitialState || state is ProfileSetState) {
            context.read<ProfileBloc>().add(ProfileShowEvent());
              }
              if (state is ProfileShowProfileLoadingState) {
                return MyLoadingScreen();
              }
              else if (state is ProfileShowProfileErrorState)  {
                return Text(StringConst.somethingWrong,style: normalTextStyle(),);
              }
              else {
                if (ProfileBloc.profileData.keys.isEmpty) {
                  return Container();
                } else {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      title: Text("${ProfileBloc.profileData['name']}",style: normalTextStyle(color: primaryColor),),
                      centerTitle: true,
                    ),
                    body: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ProfileBackgroundImages(
                              name: ProfileBloc.profileData['name'],
                              image:ProfileBloc.profileData['img_url']  ,
                            ),
                            ProfileAvatar()
                          ],
                    ),
                        SizedBox(height: 10,),
                        Text("${ProfileBloc.profileData['name']}",style: normalTextStyle(color: Colors.black),),
                        SizedBox(height: 10,),
                        Text("${ProfileBloc.profileData['email']}",style: normalTextStyle(color: Colors.grey[700]!,fontSize: 15),),
                        ProfileData(),
                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MyAnimatedRoute(page:  AddPost()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Center(
                            child: Text(
                              "إضافة منشور",style: normalTextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                        ProfileSendJoinRequest()
                  ],
                ),
              );
            }
          }
        }
        ))
    );
  }
}


