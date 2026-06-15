import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/components/snack_bar.dart';
import 'package:saa_f/core/constant/app-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/activity/data/repository/activity_repo.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';
import 'package:saa_f/features/activity/presentation/method/add_success_method.dart';
import 'package:saa_f/features/activity/presentation/screens/edit_activity.dart';
import 'package:saa_f/features/publish/presentation/widgets/publish-method.dart';
import '../../../../../core/components/material-button-componat.dart';
import '../../../../../core/components/under-line-text-filed-componant.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/constant/strings-const.dart';
import '../../../../core/components/app-text-field.dart';
import '../../../../core/components/text-form-field-information.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/constant/app_validate.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/unit/date-picker.dart';
import '../../../auth/presentation/widgets/auth_clipbath.dart';
import '../../../publish/domain/bloc/publish-event.dart';
import '../../../publish/presentation/widgets/category-item.dart';
import '../../domain/bloc/activity_event.dart';
import '../../domain/bloc/activity_state.dart';
import '../widgets/get_announced_activities/delete_dialog.dart';
import 'get_announced_activities_screen.dart';

  class ActivityPhotoScreen extends StatelessWidget {
    ActivityPhotoScreen({super.key, required this.id, required this.name, required this.age, required this.imgUrl, required this.time, required this.activityDate, required this.description, required this.activityTime});

    final int id;
    final String name;
    final String age;
    final String imgUrl;
    final String time;
    final String activityDate;
    final String activityTime;
    final String description;

    // var titleController = TextEditingController();
  // var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  // final TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  // File? myImage;
  final ActivityBloc activityBloc = ActivityBloc(activityRepository: ActivityRepo());

  final ImagePicker imagePicker = new ImagePicker();
  List <XFile>? imageFileList = [];

  Future<void> selectImage () async {
    final List<XFile> selectedImage = await imagePicker.pickMultiImage();
    if (selectedImage.isNotEmpty)
      {
        imageFileList!.addAll(selectedImage);
      }
  }
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => activityBloc,
        child: BlocListener<ActivityBloc, ActivityState>(
            listener: (context, state) {
              if (state is ConfirmActivitySuccessState )
              {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('تم', style: normalTextStyle(fontSize: 20)),
                      content: Text("تم تثبيت النشاط", style: normalTextStyle(fontSize: 16)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                ).then((value) {
                  Navigator.pop(context);
                });

              }
              else if (state is ConfirmActivityErrorState) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('', style: normalTextStyle(fontSize: 20)),
                      content: Text(StringConst.somethingWrong, style: normalTextStyle(fontSize: 16)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                ).then((value) {
                  Navigator.pop(context);
                });
              }
            },
            child: BlocBuilder<ActivityBloc, ActivityState>(
                builder: (context, state) {
                  if (state is ConfirmActivityLoadingState) {
                    return const MyLoadingScreen();
                  } else {
                    return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text("الأنشطة المعلنة"),
                        actions: [
                          PopupMenuButton(
                            itemBuilder: (ctx) => [
                              _buildPopupMenuItemToDelete('حذف',id,context),
                              _buildPopupMenuItemToEdit('تعديل',id,context),
                            ],
                          )
                        ],
                      ),
                      body: Center(
                        child:
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              // ScreenClipPath(imagePath: AssetsConst.img4,h:4,),

                              Container(
                                margin: const EdgeInsets.all(20),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Text("إن الأنشطة التي تقوم بها الجمعية الفلكية السورية تعد أحد أحجار الأساس لتحقيق شعارنا وسعينا لاستعادة أمجادنا في علم الفلك.\n"
                                      //     "صور هذه الأنشطة قد تكون صلة الوصل بيننا وبين الآخرين، ليعرفوا مقدار عملنا واستمتاعنا به",style: normalTextStyle(),),
                                      // SizedBox(height: 30,),
                                      Text(name, style: normalTextStyle(color: primaryColor,fontSize: 20),),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Image.network("${AppConst.imgUrl}$imgUrl"),
                                      ),
                                      Text(age, style: normalTextStyle(fontSize: 20),),

                                      AppTextField(
                                        verticalPadding: 30,
                                        labelText: "وصف النشاط",
                                        hintText: "أدخل وصفاً مناسباً",
                                        controller: descriptionController,
                                        validate: MyValidate.nameValidation,
                                        prefixIcon: Icon(Icons.people, color: primaryColor,),

                                      ),
                                      MaterialButtonComponent(
                                        verticalMargin: 16,
                                        onPressed: () async {
                                          print("satart send");
                                         await selectImage();
                                          context
                                              .read<ActivityBloc>()
                                              .add(PickMultiPhotoEvent());
                                          //   img_: myImage!,
                                          //   title: titleController.text,
                                          //   description: descriptionController.text,
                                          //   photographerName: photographerController.text,
                                          //   mediaCategory: selectedDropdownItem,
                                          // ));
                                        },
                                        child: Text("اختيار صور",
                                            style: buttonTextStyle()
                                        ),
                                      ),
                                      GridView.builder(
                                        itemCount: imageFileList!.length,
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 2,
                                            crossAxisSpacing: 2,
                                          ),
                                          itemBuilder: (context,index) {
                                          return GestureDetector(
                                              onTap: (){
                                                print(index);
                                                print("delete one image");
                                                print(imageFileList!.length);
                                                imageFileList!.removeAt(index);
                                                print(imageFileList!.length);
                                                context.read<ActivityBloc>().add(ActivitySetStateEvent());

                                              },
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Image.file(File(imageFileList![index].path),fit: BoxFit.cover,),
                                                  Icon(Icons.delete,color: Colors.grey.shade900,size: 30),

                                                ],
                                              ));
                                          },
                                         shrinkWrap: true,
                                      ),
                                      // photoUploadButton(context),
                                      // myImage != null?
                                      MaterialButtonComponent(
                                        verticalMargin: 16,
                                        onPressed: () {
                                          if (imageFileList!.isEmpty) {
                                            showCustomSnackBar(
                                                context,
                                                "الرجاء إدخال صور النشاط",
                                                primaryColor
                                            );
                                          }
                                          if (formKey.currentState!.validate() && imageFileList!.isNotEmpty) {
                                            print("satart send");
                                            context
                                                .read<ActivityBloc>()
                                                .add(ActivityConfirmEvent(
                                              description: descriptionController.text,
                                              activityFile: imageFileList!,
                                              id: id,
                                            ));

                                          }

                                        },
                                        child: Text("تثبيت",
                                            style: buttonTextStyle()
                                        ),
                                      )
                                          // :
                                      // SizedBox()
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  }
                }
            )
        )
    );
  }



    PopupMenuItem _buildPopupMenuItemToDelete(
        String title, int id,context) {
      return PopupMenuItem(
        child:  Text(title,style: normalTextStyle(fontSize: 15)),
        onTap: (){
          showAlertDialogToDeleteActivity (context,id);
        },
      );
    }
    PopupMenuItem _buildPopupMenuItemToEdit(
        String title, int id,context) {
      return PopupMenuItem(
        onTap: () {
          Navigator.of(context).push(
              MyAnimatedRoute(
                  page: EditActivityScreen(
                    id: id,
                    title: name,
                    time: time,
                    img: imgUrl,
                    age: age,
                    description: description,
                    activityDate: activityDate,
                      activityTime : activityTime
                  )))
              .then((value) =>
          {

          }
          );
        },
        child:  Text(title,style: normalTextStyle(fontSize: 15)),
      );
    }
    //
  // Widget photoUploadButton(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 30),
  //     width: double.infinity,
  //     height: SizeConfig.screenHeight! / 3,
  //     decoration: BoxDecoration(
  //         color: Colors.grey[400],
  //         borderRadius: BorderRadius.all(Radius.circular(25)),
  //         border: Border.all(
  //           color: primaryColor,
  //           width: 2,
  //         ),
  //         image:
  //         myImage != null ?
  //         DecorationImage(
  //             image: FileImage(myImage!),
  //             fit: BoxFit.cover
  //         )
  //             :
  //         null
  //     ),
  //     child: IconButton(
  //       onPressed: () {
  //         print("Upload Photo");
  //         _pickImage(context);
  //       },
  //       icon: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(Icons.photo_library_outlined,
  //             color: myImage == null ? Colors.black : Colors.grey.withOpacity(
  //                 0.5),),
  //           Icon(Icons.upload,
  //             color: myImage == null ? Colors.black : Colors.grey.withOpacity(
  //                 0.5),),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  // Future  _pickImage (BuildContext context) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     this.myImage = imageTemporary;
  //     // context
  //     //     .read<ActivityBloc>()
  //     //     .add(InsertImagePickPhotoEvent());
  //   }
  //   on PlatformException catch (e) {
  //     print ('Failed to pick image : $e');
  //   }
  // }
}

