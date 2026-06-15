import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/router/router_name.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';
import '../../widgets/admin-publish/post-info-publish-date.dart';
import '../../widgets/category-item.dart';
import '../../widgets/admin-publish/show-image-publish-request/image-info-publish-button-row.dart';
import '../../widgets/admin-publish/show-image-publish-request/image-info-publish-photo.dart';
import '../../widgets/post/image-post-description.dart';
import '../../widgets/post/post-user-info.dart';
import '../../widgets/publish-method.dart';


class ImageInfoPublish extends StatefulWidget {
  ImageInfoPublish({super.key, required this.id, required this.title});

  final int id;
  final String title;

  @override
  State<ImageInfoPublish> createState() => _ImageInfoPublishState();
}

class _ImageInfoPublishState extends State<ImageInfoPublish> {
   final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

   var formKey = GlobalKey<FormState>();

   var localCategory ;

   var selectedDropdownItem = "start" ;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
          create: (BuildContext context) => publishBloc,
          child: BlocListener<PublishBloc, PublishState>(
              listener: (context, state) {
                if (state is ImageInfoPublishSuccessState) {
                  localCategory =  selectedDropdownItem !="start"? selectedDropdownItem : state.imageInfoModel.data!.mediaCategory!;
                }
                else if (state is ImageInfoPublishAcceptSuccessState) {
                  publishSuccessMethod(state, context, "تم نشر الصورة", "Success","pop");
                }
                else if (state is ImageInfoPublishRefuseSuccessState) {
                  publishSuccessMethod(state, context, "تم رفض الصورة", "تم",
                      "pop");
                }
                else if (state is ImageInfoPublishErrorState || state is ImageInfoPublishAcceptErrorState || state is ImageInfoPublishRefuseErrorState) {
                  publishErrorCoolAlert(state, context, "الرجاء المحاولة لاحقاً", "حصل خطأ ما");
                }
              },
              child: BlocBuilder<PublishBloc, PublishState>(
                  builder: (context, state) {
                    if(state is PublishInitState ) {
                      context
                          .read<PublishBloc>()
                          .add(ImageInfoPublishRequestsEvent(id: widget.id));
                    }
                    return SafeArea(
                      child: Scaffold(
                        appBar: AppBar(title: Text (widget.title),),
                        body:
                        state is ImageInfoPublishLoadingState || state is ImageInfoPublishAcceptLoadingState ||  state is ImageInfoPublishRefuseLoadingState?
                        const Center(child: CircularProgressIndicator())
                            :
                        state is ImageInfoPublishSuccessState ?
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PostUserInfo(userName: state.imageInfoModel.data!.userName!, userPhoto: state.imageInfoModel.data?.userProfileImg?? null),
                                  ImageInfoPublishPhoto(img: state.imageInfoModel.data!.imgUrl!),
                                  ImagePostDescription(description: state.imageInfoModel.data!.description!, photographerName: state.imageInfoModel.data!.photographerName!,),
                                  SizedBox(height: SizeConfig.screenHeight!/40,),
                                  // choseCategory function
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("تصنيف الصورة", style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis,
                                        ),),
                                        Container(
                                          width: double.infinity,
                                          alignment: Alignment.topCenter,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: DropdownButton<String>(
                                                  value: localCategory,
                                                  items: categoryItem.map((String value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          value,
                                                        style: normalTextStyle(),),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  elevation: 1,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      localCategory = value!;
                                                      selectedDropdownItem = value;
                                                      print("selectedDrop " + selectedDropdownItem);
                                                      print("localCategory " + localCategory);
                                                      (context as Element).markNeedsBuild();

                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  PostInfoPublishDate(date: state.imageInfoModel.data!.createdAt! , time: state.imageInfoModel.data!.createdAtRelative!),
                                  ImageInfoPublishButtonRow(
                                    id: widget.id,
                                    category: selectedDropdownItem !="start"? selectedDropdownItem : state.imageInfoModel.data!.mediaCategory!,
                                    description: state.imageInfoModel.data!.description!,),
                              ],
                              ),
                            ),
                          ),
                        )
                            :
                        state is ImageInfoPublishErrorState || state is ImageInfoPublishAcceptErrorState || state is ImageInfoPublishRefuseErrorState ?

                        Center(child: Text (
                          "عذراً حصل خطأ ما\n"
                              "الرجاء المحاولة لاحقاً ",
                          style: normalTextStyle(),
                        ),)
                    :
                        SizedBox(),
                      ),
                    );
                  }
              )
          )
      ),
    );
  }


}
