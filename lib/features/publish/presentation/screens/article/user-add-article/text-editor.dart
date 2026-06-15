// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../../core/components/material-button-componat.dart';
// import '../../../../../../core/constant/responsive/MediaQuery.dart';
// import '../../../../../../core/router/router_name.dart';
// import '../../../../domain/bloc/publish-event.dart';
// import '../../../widgets/category-item.dart';
// import '../../../widgets/publish-method.dart';
// class TextEditor extends StatelessWidget {
//
//   var titleController = TextEditingController();
//   var articleWriterController = TextEditingController();
//   final HtmlEditorController controller = HtmlEditorController();
//   var formKey = GlobalKey<FormState>();
//   File? myImage;
//   String selectedDropdownItem = categoryItem[0];
//   final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Directionality(
//         textDirection: TextDirection.rtl,
//       child: BlocProvider(
//           create: (BuildContext context) => publishBloc,
//           child: BlocListener<PublishBloc, PublishState>(
//               listener: (context, state) {
//                 if (state is InsertArticleHtmlSuccessState ) {
//                   publishSuccessMethod(state, context , "بانتظار موافقة المشرف" , "تم رفع المقال", homeRoutePath);
//                 }
//                 else if (state is InsertArticleHtmlErrorState) {
//                   publishErrorCoolAlert(state,context, "الرجاء المحاولة لاحقاً","حصل خطأ ما");
//                 }
//               },
//               child: BlocBuilder<PublishBloc, PublishState>(
//                   builder: (context, state) {
//                     return SafeArea(
//                       child: Scaffold(
//                         appBar: AppBar(title: Text ("نشر مقال"),),
//                         body: Center(
//                           child:
//                           state is InsertArticleHtmlLoadingState ?
//                           CircularProgressIndicator()
//                               :
//                           Container(
//                             margin: const EdgeInsets.all(20),
//                             child: SingleChildScrollView(
//                               child: Form(
//                                 key: formKey,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text("حاول أن يكون المقال مختصراً وبسيطاً وواضحاً حتى يستمتع الناس بقراءته"
//                                         "\n\nحاول أن تضيف لمستكَ الفنية على المقال، يمكنكَ استخدام محرر النصوص التالي"
//                                         "\n\nحاول ألا تضع الكثير من الصور بداخل المقال حتى يتسنى للمتابعين تحميله وقراءته بدون مشاكل"
//                                         "\n\في البداية، عليك أن تضيف صورة رئيسية لعرضها في بداية المقال",
//                                       style: TextStyle(fontSize: 25),),
//                                     photoUploadButton(context),
//                                     UnderLineTextFieldComponant(
//                                       horizontalPadding: 8,
//                                       verticalPadding: 8,
//                                       maxLength: 50,
//                                       labelText: "عنوان المقال",
//                                       hintText: "",
//                                       suffixIcon: Icon(Icons.topic),
//                                       controller: titleController,
//                                       validate: (value) {
//                                         if (value!.isEmpty) {
//                                           return "الرجاء إدخال عنوان المقال";
//                                         }
//                                       },
//                                     ),
//                                     UnderLineTextFieldComponant(
//                                       horizontalPadding: 8,
//                                       verticalPadding: 8,
//                                       maxLength: 50,
//                                       labelText: "كاتب المقال",
//                                       hintText: "أدخل اسم كاتب المقال في حال لم يكن أنت",
//                                       suffixIcon: Icon(Icons.person),
//                                       controller: articleWriterController,
//
//                                     ),
//                                     HtmlEditor(
//
//                                       controller: controller,
//                                       htmlEditorOptions: HtmlEditorOptions(
//
//                                         shouldEnsureVisible: true,
//                                         hint: "your text",
//                                         spellCheck: true,
//                                         adjustHeightForKeyboard: false,
//                                         autoAdjustHeight: true,
//
//                                       ),
//
//                                       htmlToolbarOptions: HtmlToolbarOptions(
//
//
//                                         toolbarPosition: ToolbarPosition.belowEditor,
//                                         toolbarType: ToolbarType.nativeGrid,
//
//                                         //by default
//                                         // onButtonPressed:
//                                         //     (ButtonType type, bool? status, Function? updateStatus) {
//                                         //   print(
//                                         //       "button '${describeEnum(type)}' pressed, the current selected status is $status");
//                                         //   return true;
//                                         // },
//                                         // onDropdownChanged: (DropdownType type, dynamic changed,
//                                         //     Function(dynamic)? updateSelectedItem) {
//                                         //   print(
//                                         //       "dropdown '${describeEnum(type)}' changed to $changed");
//                                         //   return true;
//                                         // },
//                                         mediaLinkInsertInterceptor:
//                                             (String url, InsertFileType type) {
//
//                                           print(url);
//                                           return true;
//                                         },
//                                         mediaUploadInterceptor:
//                                             (PlatformFile file, InsertFileType type) async {
//
//
//                                           print(file.name); //filename
//                                           print(file.size); //size in bytes
//                                           print(file.extension); //file extension (eg jpeg or mp4)
//                                           return true;
//                                         },
//
//                                       ),
//                                       otherOptions: OtherOptions(
//                                         height: SizeConfig.screenHeight!/1,
//
//                                       ),
//                                     ),
//                                     choseCategory(context),
//                                     myImage != null?
//                                     MaterialButtonComponent(
//                                       verticalMargin: 16,
//                                       onPressed: () async {
//                                         if (formKey.currentState!.validate()) {
//                                           print("satart send");
//                                           print("_____________________--");
//                                           print("_____________________--");
//                                           print("_____________________--");
//                                           print("_____________________--");
//
//                                           context
//                                               .read<PublishBloc>()
//                                               .add(InsertArticleHtmlRequestEvent(
//                                             img_: myImage!,
//                                             title: titleController.text,
//                                             article: await controller.getText() ,
//                                             mediaCategory: selectedDropdownItem,
//                                             articleWriter: articleWriterController.text
//                                           ));
//
//                                         }
//
//                                       },
//                                       child: Text("إرسال",
//                                           style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.white
//                                           )
//                                       ),
//                                     )
//                                         :
//                                     SizedBox()
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//               )
//           )
//       ),
//     );
//   }
//
//   Widget photoUploadButton(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 30),
//       width: double.infinity,
//       height: SizeConfig.screenHeight! / 3,
//       decoration: BoxDecoration(
//           color: Colors.grey[400],
//           borderRadius: BorderRadius.all(Radius.circular(25)),
//           border: Border.all(
//             color: primaryColor,
//             width: 2,
//           ),
//           image:
//           myImage != null ?
//           DecorationImage(
//               image: FileImage(myImage!),
//               fit: BoxFit.cover
//           )
//               :
//           null
//       ),
//       child: IconButton(
//         onPressed: () {
//           print("Upload Photo");
//           _pickImage(context);
//         },
//         icon: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.photo_library_outlined,
//               color: myImage == null ? Colors.black : Colors.grey.withOpacity(
//                   0.5),),
//             Icon(Icons.upload,
//               color: myImage == null ? Colors.black : Colors.grey.withOpacity(
//                   0.5),),
//           ],
//         ),
//       ),
//     );
//   }
//   Future  _pickImage (BuildContext context) async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       this.myImage = imageTemporary;
//       context
//           .read<PublishBloc>()
//           .add(InsertArticlePickPhotoEvent());
//     }
//     on PlatformException catch (e) {
//       print ('Failed to pick image : $e');
//     }
//   }
//   Widget choseCategory(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//               "التصنيف",
//               style: TextStyle(
//                 color: primaryColor,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w900,
//                 overflow: TextOverflow.ellipsis,
//               )
//           ),
//           Text(
//               "الرجاء اختيار أحد التصنيفات:",
//               style: TextStyle(
//                 color: Colors.grey[400],
//                 fontSize: 14,
//                 fontWeight: FontWeight.w900,
//                 overflow: TextOverflow.ellipsis,
//               )
//           ),
//           Container(
//             width: double.infinity,
//             alignment: Alignment.topCenter,
//
//             child: Row(
//               children: [
//
//                 Expanded(
//                   child: DropdownButton<String>(
//                     value: selectedDropdownItem,
//                     items: categoryItem.map((String value) {
//                       return DropdownMenuItem<String>(
//
//                         value: value,
//                         child: Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                               value,
//                               style:
//                               Theme
//                                   .of(context)
//                                   .textTheme
//                                   .headlineMedium
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                     dropdownColor: Colors.transparent,
//                     elevation: 1,
//
//                     onChanged: (value) {
//                       selectedDropdownItem = value!;
//                       context
//                           .read<PublishBloc>()
//                           .add(InsertArticleChangItemEvent());
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//
