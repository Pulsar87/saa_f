// import 'dart:io';
//
// import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:saa_f/core/components/app-text-field.dart';
// import 'package:saa_f/core/themes/text_style.dart';
// import '../../../../core/components/drop_down_button.dart';
// import '../../../../core/components/material-button-componat.dart';
// import '../../../../core/components/text-form-field-information.dart';
// import '../../../../core/constant/app-const.dart';
// import '../../../../core/constant/app_validate.dart';
// import '../../../../core/constant/assets-const.dart';
// import '../../../../core/constant/colors/light-colors.dart';
// import '../../../../core/constant/responsive/MediaQuery.dart';
// import '../../../../core/unit/date-picker.dart';
// import '../../../../core/unit/list.dart';
// import '../../../JoinRequest/presentation/widget/join-text.dart';
// import '../../../auth/presentation/widgets/auth_clipbath.dart';
// import '../../domain/bloc/profile_bloc.dart';
//
// class AddActivityScreen extends StatefulWidget {
//   const AddActivityScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddActivityScreen> createState() => _AddActivityScreenState();
// }
//
// class _AddActivityScreenState extends State<AddActivityScreen> {
//   late ActivityBloc bloc = context.read<ActivityBloc>();
//
//   @override
//   void initState() {
//     bloc.add(GetAdminMemberEvent());
//     super.initState();
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   Future selectImage(BuildContext context) async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       bloc.photo = imageTemporary;
//       bloc.add(InsertImagePickPhotoEvent());
//     } on PlatformException catch (e) {
//       print('Failed to pick image : $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     void _onDateButtonPressed(BuildContext context)  {
//      var pickedDate =
//           DatePickerUtils.selectDate(context, bloc.selectedDate)??DateTime.now();
//       if (pickedDate != null) {
//         Navigator.pop(context);
//         DatePickerUtils.handleDateTimeSelection(context, bloc.dateController);
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(AppConst.addActivity),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ScreenClipPath(imagePath: AssetsConst.img4,h:4,),
//
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Form(
//                 key: bloc.activityKey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       // Container(),
//                       const JoinText(
//                         textAlign: TextAlign.start,
//                         text:' إضافة نشاط جديد',
//                         isHeader: true,
//                       ),
//                       // AppTextField(
//                       //   verticalPadding: 40,
//                       //   controller: emailController,
//                       //   validate: (value) {
//                       //     if (value!.isEmpty)
//                       //     { return StringConst.emptyValidate;}
//                       //     else if (!validateEmail(value))
//                       //     { return StringConst.emailValidate ;}
//                       //     return null; // البريد الإلكتروني صالح
//                       //   },
//                       //   textInputType: TextInputType.emailAddress,
//                       //   prefixIcon: Icon(Icons.email_outlined, color: darkGrey,),
//                       //   hintText: StringConst.enterEmail,
//                       //   labelText: StringConst.email,
//                       // ),
//                       SizedBox(height: 20,),
//
//                       AppTextField(
//                         // verticalPadding: 40,
//                           prefixIcon: Icon(Icons.abc, color: primaryColor,),
//                         controller: bloc.nameController,
//                         labelText: "اسم النشاط",
//                         hintText: "الرجاء إدخال اسم هذا النشاط",
//                         validate: MyValidate.nameValidation,
//
//                       ),
//                       AppTextField(
//                         verticalPadding: 30,
//
//                         labelText: "وصف النشاط",
//                         hintText: "أدخل وصفاً مناسباً",
//                         controller: bloc.descriptionController,
//                         validate: MyValidate.nameValidation,
//                         prefixIcon: Icon(Icons.people, color: primaryColor,),
//
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: GestureDetector(
//                               onTap : () {
//                                 print ("choose data");
//                                 var pickedDate =
//                                 DatePickerUtils.selectDate(context, bloc.selectedDate)??DateTime.now();
//                                 if (pickedDate != null) {
//                                   print("SELECT DATA IS ${bloc.selectedDate}");
//                                   Navigator.pop(context);
//                                 }
//                                 },
//                               child: AppTextField(
//                                 labelText: "التاريخ",
//                                 prefixIcon: Icon(Icons.date_range),
//                                 enabled: false,
//                               ),
//                             ),
//                             // child: TextFromFieldInformation(
//                             //   isIcons: true,
//                             //   text: 'التاريخ',
//                             //   // hintText: "التاريخ والوقت",
//                             //   isChanged: true,
//                             //   controller: bloc.dateController,
//                             //   validate: (String? value ) {
//                             //     if (value!.isEmpty)
//                             //       return "";
//                             // },
//                             //   function: () => _onDateButtonPressed(context),
//                             // ),
//                           ),
//                           SizedBox(width: 20,),
//                           Expanded(
//                             child: TextFromFieldInformation(
//                               isIcons: true,
//                               prefixIcon: Icon(Icons.people, color: darkGrey,),
//
//                               text: 'موعد النشاط',
//                               hintText: "التاريخ والوقت",
//                               isChanged: true,
//                               controller: bloc.dateController,
//                               validate: MyValidate.nameValidation,
//                               function: () => _onDateButtonPressed(context),
//                             ),
//                           ),
//                         ],
//                       ),
//                       // const JoinText(
//                       //   text: 'الرجاء ادخال نوع النشاط',
//                       //   isHeader: true,
//                       // ),
//                       // Padding(
//                       //   padding: const EdgeInsets.all(8.0),
//                       //   child: Text("نوع النشاط:",style: normalTextStyle(),),
//                       // ),
//                       //
//                       // CustomDropDownButton(
//                       //   options: type,
//                       //   selectedOption: bloc.type,
//                       //   onChanged: (String? newValue) {
//                       //     setState(() {
//                       //       bloc.type = newValue!;
//                       //     });
//                       //   },
//                       // ),
//                       //
//                       // AppTextField(
//                       //   verticalPadding: 30,
//                       //   labelText: "مكان النشاط",
//                       //   hintText: "الرجاء ادخال مكان النشاط",
//                       //   controller: bloc.placeController,
//                       //   validate: MyValidate.nameValidation,
//                       // ),
//                       // const JoinText(
//                       //   text: 'الرجاء ادخال عمر المشاركين ضمن النشاط',
//                       //   isHeader: true,
//                       // ),
//                       SizedBox(height: 30,),
//                       AppTextField(
//                         hintText: "الفئة المستهدفة من النشاط",
//                         labelText: "الفئة العمرية",
//                         prefixIcon: Icon(Icons.family_restroom, color: primaryColor,),
//                         controller: bloc.ageController,
//                         validate: MyValidate.nameValidation,
//                       ),
//                       // const JoinText(
//                       //   text: 'الرجاء ادخال العضو المسؤل عن هذا النشاط ',
//                       //   isHeader: true,
//                       // ),
//                       BlocBuilder<ActivityBloc, ActivityState>(
//                         builder: (context, state) {
//                           return Column(
//                             children: [
//                               // DropdownButtonFormField<int>(
//                               //   value: bloc.memberId,
//                               //   items: bloc.memberModel.data?.members
//                               //       ?.map(
//                               //         (e) =>
//                               //         DropdownMenuItem<int>(
//                               //           value: e.id,
//                               //           child: Text(e.arabicName.toString()),
//                               //         ),
//                               //   )
//                               //       .toList() ??
//                               //       [],
//                               //   onChanged: (int? value) {
//                               //     bloc.memberId = value;
//                               //     print(value);
//                               //   },
//                               //   style: const TextStyle(
//                               //     color: Colors.black,
//                               //     fontSize: 16.0,
//                               //   ),
//                               //   decoration: const InputDecoration(
//                               //     border: OutlineInputBorder(),
//                               //   ),
//                               // ),
//                               photoUploadButton(context),
//                             ],
//                           );
//                         },
//                       ),
//                       BlocListener<ActivityBloc, ActivityState>(
//                         listener: (context, state) {
//
//                           if(state is AddActivitySuccessState){
//                             bloc.add(GetAnActivityEvent());
//                             bloc.add(DeleteTextDateEvent());
//
//                             CoolAlert.show(
//                                 context: context,
//                                 type: CoolAlertType.success,
//                                 title: "نجاح",
//                                 text: "تمت اضافة النشاط بنجاح",
//                                 autoCloseDuration: const Duration(seconds: 2),
//                                 width: SizeConfig.width20)
//                                 .then((value) =>
//                                 // context.pop()
//                               Navigator.pop(context)
//                             );
//                           }
//                           if(state is AddActivityErrorState){
//                             CoolAlert.show(
//                                 context: context,
//                                 type: CoolAlertType.error,
//                                 title: "فشل",
//                                 text: state.errorModel.errors?.first,
//                                 autoCloseDuration: const Duration(seconds: 5),
//                                 width: SizeConfig.width20);
//                           }
//                         },
//                         child: bloc.photo!=null? MaterialButtonComponent(
//                           onPressed: () {
//                             bloc.add(AddActivityEvent());
//
//                             print(bloc.dateController.text);
//                           },
//                           child: const Text('اضافة'),
//                         )
//                             :
//                             SizedBox()
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
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
//           image: bloc.photo != null
//               ? DecorationImage(
//               image: FileImage(bloc.photo!), fit: BoxFit.cover)
//               : null),
//       child: IconButton(
//         onPressed: () {
//           print("Upload Photo");
//           selectImage(context);
//         },
//         icon: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.photo_library_outlined,
//               color: bloc.photo == null
//                   ? Colors.black
//                   : Colors.grey.withOpacity(0.5),
//             ),
//             Icon(
//               Icons.upload,
//               color: bloc.photo == null
//                   ? Colors.black
//                   : Colors.grey.withOpacity(0.5),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
