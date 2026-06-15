// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../../core/components/drop_down_button.dart';
// import '../../../../core/components/text-form-field-information.dart';
// import '../../../../core/constant/app_validate.dart';
// import '../../../../core/constant/colors/light-colors.dart';
// import '../../../../core/constant/responsive/MediaQuery.dart';
// import '../../../../core/unit/date-picker.dart';
// import '../../../../core/unit/home_list_view.dart';
// import '../../../../core/unit/list.dart';
// import '../../../JoinRequest/presentation/widget/join-text.dart';
// import '../../domain/bloc/profile_bloc.dart';
//
// class ActivityAlert extends StatefulWidget {
//   const ActivityAlert({
//     Key? key,
//     required this.bloc,
//     required this.activityInformation,
//   }) : super(key: key);
//   final ActivityBloc bloc;
//   final ActivityInformation activityInformation;
//
//   @override
//   State<ActivityAlert> createState() => _ActivityAlertState();
// }
//
// class _ActivityAlertState extends State<ActivityAlert> {
//   late ActivityBloc bloc;
//   late String id;
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
//   void _onDateButtonPressed(BuildContext context) async {
//     ActivityBloc bloc = context.read<ActivityBloc>();
//     final DateTime? pickedDate =
//         await DatePickerUtils.selectDate(context, bloc.selectedDate);
//     if (pickedDate != null) {
//        DatePickerUtils.handleDateTimeSelection(context, bloc.dateController);
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     bloc = context.read<ActivityBloc>();
//     bloc.add(GetAdminMemberEvent());
//
//     super.initState();
//
//     bloc.nameController.text = widget.activityInformation.name ?? '';
//     bloc.descriptionController.text =
//         widget.activityInformation.description ?? '';
//     bloc.dateController.text = widget.activityInformation.date ?? '';
//     bloc.placeController.text = widget.activityInformation.place ?? '';
//     bloc.ageController.text = widget.activityInformation.age ?? '';
//     id = widget.activityInformation.id ?? "";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//         side: BorderSide(width: 2.0, color: primaryColor),
//       ),
//       contentPadding:
//           const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//       // backgroundColor: ,
//       content: SizedBox(
//         height: SizeConfig.height1,
//         width: SizeConfig.width1,
//         child: SingleChildScrollView(
//           child: Wrap(
//             alignment: WrapAlignment.center,
//             runSpacing: SizeConfig.height30!,
//             children: [
//               Text(
//                 "الرجاء ادخال المعلومات لتعديل النشاط",
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               JoinText(
//                 text: id,
//                 isHeader: true,
//               ),
//               const SizedBox(height: 20),
//               Form(
//                 key: widget.bloc.updateActivityKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     TextFormField(
//                       decoration: const InputDecoration(
//                           labelText: "اسم",
//                           hintText: 'الرجاء ادخال اسم النشاط'),
//                       keyboardType: TextInputType.text,
//                       controller: bloc.nameController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'الرجاء ادخال اسم';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                           labelText: " وصف", hintText: ' ادخل وصف النشاط'),
//                       keyboardType: TextInputType.text,
//                       controller: bloc.descriptionController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'الرجاء ادخال وصف النشاط';
//                         }
//                         return null;
//                       },
//                     ),
//                     const JoinText(
//                       text: 'الرجاء ادخال تاريخ النشاط',
//                       isHeader: true,
//                     ),
//                     TextFromFieldInformation(
//                       isIcons: true,
//                       hintText: 'تاريخ الميلاد',
//                       isChanged: true,
//                       controller: bloc.dateController,
//                       validate: MyValidate.nameValidation,
//                       function:()=> _onDateButtonPressed(context),
//                     ),
//                     const JoinText(
//                       text: 'الرجاء ادخال نوع النشاط',
//                       isHeader: true,
//                     ),
//                     CustomDropDownButton(
//                       options: type,
//                       selectedOption: bloc.type,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           bloc.type = newValue!;
//                         });
//                       },
//                     ),
//                     SizedBox(
//                       height: SizeConfig.height40,
//                     ),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                           labelText: "  مكان", hintText: ' ادخل مكان النشاط'),
//                       controller: bloc.placeController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'الرجاء ادخال  مكان النشاط';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: SizeConfig.height40,
//                     ),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                           labelText: "  عمر", hintText: ' ادخل عمر '),
//                       controller: bloc.ageController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'الرجاء ادخال عمر';
//                         }
//                         return null;
//                       },
//                     ),
//                     const JoinText(
//                       text: 'الرجاء ادخال العضو المسؤل عن هذا النشاط ',
//                       isHeader: true,
//                     ),
//                     BlocBuilder<ActivityBloc, ActivityState>(
//                       builder: (context, state) {
//                         return Column(
//                           children: [
//                             DropdownButtonFormField<int>(
//                               value: bloc.memberId,
//                               items: bloc.memberModel.data?.members
//                                       ?.map(
//                                         (e) => DropdownMenuItem<int>(
//                                           value: e.id,
//                                           child: Text(e.arabicName.toString()),
//                                         ),
//                                       )
//                                       .toList() ??
//                                   [],
//                               onChanged: (int? value) {
//                                 bloc.memberId = value;
//                                 print(value);
//                               },
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16.0,
//                               ),
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                             photoUploadButton(context),
//                           ],
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         if (widget.bloc.updateActivityKey.currentState!
//                             .validate()) {
//                           Navigator.pop(context);
//                           bloc.add(EditActivityEvent(id: id));
//                         }
//                       },
//                       child: const Text(
//                         "تعديل",
//                         style: TextStyle(fontSize: 20),
//                       )),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       bloc.add(GetAnActivityEvent());
//                     },
//                     child: const Text(
//                       "إلغاء",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
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
//                   image: FileImage(bloc.photo!), fit: BoxFit.cover)
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
