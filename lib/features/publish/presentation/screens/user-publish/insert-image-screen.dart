import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../../core/components/material-button-componat.dart';
import '../../../../../core/components/under-line-text-filed-componant.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/constant/strings-const.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';
import '../../widgets/category-item.dart';
import '../../widgets/publish-method.dart';
import '../../widgets/user-publish/insert-post-title.dart';

class InsertImageScreen extends StatelessWidget {

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var photographerController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  File? myImage;
  String selectedDropdownItem = categoryItem[0];
  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {
              if (state is InsertImageSuccessState )
              {
                publishSuccessMethod(state, context , "بانتظار موافقة المشرف" , "تم رفع الصورة", "pop");
              }
              else if (state is InsertImageErrorState) {
                publishErrorCoolAlert(
                    state, context, StringConst.somethingWrong, StringConst.sorry);
              }
            },
            child: BlocBuilder<PublishBloc, PublishState>(
                builder: (context, state) {
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(title: Text ("نشر صورة"),),
                      body: Center(
                        child:
                        state is InsertImageLoadingState ?
                        MyLoadingScreen()
                            :
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InsertPostTitle(text:   "إن كان لديكَ صوراً فلكيةً مذهلة تريد عرضها على موقعنا، يمكنك مشاركتها معنا",),
                                  photoUploadButton(context),
                                  UnderLineTextFieldComponant(
                                    horizontalPadding: 8,
                                    verticalPadding: 8,
                                    maxLength: 50,
                                    labelText: "عنوان الصورة",
                                    hintText: "",
                                    suffixIcon: Icon(Icons.camera),
                                    controller: titleController,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return "الرجاء إدخال عنوان الصورة";
                                      }
                                    },
                                  ),
                                  UnderLineTextFieldComponant(
                                    horizontalPadding: 8,
                                    verticalPadding: 8,
                                    maxLength: 500,
                                    labelText: "وصف الصورة",
                                    hintText: "أخبرنا بحكاية هذه الصورة",
                                    suffixIcon: Icon(Icons.description),
                                    controller: descriptionController,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return "الرجاء إدخال وصف الصورة";
                                      }
                                    },
                                  ),
                                  UnderLineTextFieldComponant(
                                    horizontalPadding: 8,
                                    verticalPadding: 8,
                                    maxLength: 100,
                                    hintText: "من هو المبدع الذي التقط الصورة؟",
                                    labelText: "المصور",
                                    suffixIcon: Icon(Icons.person),
                                    controller: photographerController,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return "الرجاء إدخال اسم المصور";
                                      }
                                      else if (value!.length<3) {
                                        return "يجب أن يحتوي اسم المصور 3 أحرف على الأقل";
                                      }
                                    },

                                  ),
                                  choseCategory(context),
                                  myImage != null?
                                  MaterialButtonComponent(
                                    verticalMargin: 16,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        print("satart send");
                                        context
                                            .read<PublishBloc>()
                                            .add(InsertImageRequestEvent(
                                            img_: myImage!,
                                          title: titleController.text,
                                          description: descriptionController.text,
                                            photographerName: photographerController.text,
                                            mediaCategory: selectedDropdownItem,
                                        ));

                                      }

                                    },
                                    child: Text("إرسال",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white
                                        )
                                    ),
                                  )
                                      :
                                      SizedBox()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                )
        )
    );
  }

  Widget photoUploadButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      height: SizeConfig.screenHeight! / 3,
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            color: primaryColor,
            width: 2,
          ),
          image:
          myImage != null ?
          DecorationImage(
              image: FileImage(myImage!),
              fit: BoxFit.cover
          )
              :
          null
      ),
      child: IconButton(
        onPressed: () {
          print("Upload Photo");
          _pickImage(context);
        },
        icon: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_library_outlined,
              color: myImage == null ? Colors.black : Colors.grey.withOpacity(
                  0.5),),
            Icon(Icons.upload,
              color: myImage == null ? Colors.black : Colors.grey.withOpacity(
                  0.5),),
          ],
        ),
      ),
    );
  }
  Future  _pickImage (BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.myImage = imageTemporary;
      context
          .read<PublishBloc>()
          .add(InsertImagePickPhotoEvent());
    }
    on PlatformException catch (e) {
      print ('Failed to pick image : $e');
    }
  }
  Widget choseCategory(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "تصنيف الصورة",
              style: TextStyle(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                overflow: TextOverflow.ellipsis,
              )
          ),
          Text(
              "الرجاء اختيار أحد التصنيفات:",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                fontWeight: FontWeight.w900,
                overflow: TextOverflow.ellipsis,
              )
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,

            child: Row(
              children: [

                Expanded(
                  child: DropdownButton<String>(
                    value: selectedDropdownItem,
                    items: categoryItem.map((String value) {
                      return DropdownMenuItem<String>(

                        value: value,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                              value,
                              style: normalTextStyle(),
                          ),
                        ),
                      );
                    }).toList(),
                    elevation: 1,

                    onChanged: (value) {
                      selectedDropdownItem = value!;
                      context
                          .read<PublishBloc>()
                          .add(InsertImageChangItemEvent());
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

