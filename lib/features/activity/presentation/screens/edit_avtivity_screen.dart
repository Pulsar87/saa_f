// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../../core/constant/colors/light-colors.dart';
//
// class EditActivityScreen extends StatefulWidget {
//   const EditActivityScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EditActivityScreen> createState() => _EditActivityScreenState();
// }
//
// class _EditActivityScreenState extends State<EditActivityScreen> {
//   late ActivityBloc bloc=context.read<ActivityBloc>();
//   @override
//   void initState() {
//     bloc.add(GetAdminMemberEvent());
//     super.initState();
//   }
//   Future selectImage(BuildContext context) async {
//     try {
//
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
//     ActivityBloc bloc = context.read<ActivityBloc>();
//     void _onDateButtonPressed(BuildContext context) async {
//       ActivityBloc bloc = context.read<ActivityBloc>();
//       final DateTime? pickedDate =
//           await DatePickerUtils.selectDate(context, bloc.selectedDate);
//       if (pickedDate != null) {
//         DatePickerUtils.handleDateTimeSelection(context, bloc.dateController);
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(AppConst.addActivity),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: bloc.activityKey,
//             child: Wrap(
//               runSpacing: SizeConfig.height40!,
//               children: [
//                 Container(),
//                 const JoinText(
//                   textAlign: TextAlign.start,
//                   text: 'الرجاء ادخال اسم النشاط',
//                   isHeader: true,
//                 ),
//                 TextFromFieldInformation(
//                   hintText: "ادخال اسم النشاظ",
//                   isChanged: false,
//                   controller: bloc.nameController,
//                   validate: MyValidate.nameValidation,
//                 ),
//                 const JoinText(
//                   text: 'الرجاء ادخال وصف للنشاط',
//                   isHeader: true,
//                 ),
//                 TextFromFieldInformation(
//                   hintText: "وصف النشاط",
//                   isChanged: false,
//                   controller: bloc.descriptionController,
//                   validate: MyValidate.nameValidation,
//                 ),
//                 const JoinText(
//                   text: 'الرجاء ادخال تاريخ بداية لنشاط',
//                   isHeader: true,
//                 ),
//                 TextFromFieldInformation(
//                   isIcons: true,
//                   hintText: 'تاريخ الميلاد',
//                   isChanged: true,
//                   controller: bloc.dateController,
//                   validate: MyValidate.nameValidation,
//                   function: () => _onDateButtonPressed(context),
//                 ),
//                 const JoinText(
//                   text: 'الرجاء ادخال نوع النشاط',
//                   isHeader: true,
//                 ),
//                 CustomDropDownButton(
//                   options: type,
//                   selectedOption: bloc.type,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       bloc.type = newValue!;
//                     });
//                   },
//                 ),
//                 const JoinText(
//                   text: 'الرجاء ادخال مكان النشاط',
//                   isHeader: true,
//                 ),
//                 TextFromFieldInformation(
//                   hintText: "ادخال مكان النشاط",
//                   isChanged: false,
//                   controller: bloc.placeController,
//                   validate: MyValidate.nameValidation,
//                 ),
//                 const JoinText(
//                   text: 'الرجاء ادخال عمر المشاركين ضمن النشاط',
//                   isHeader: true,
//                 ),
//                 TextFromFieldInformation(
//                   hintText: "ستة سنوات",
//                   isChanged: false,
//                   controller: bloc.ageController,
//                   validate: MyValidate.nameValidation,
//                 ),
//                 const JoinText(
//                   text: 'الرجاء ادخال العضو المسؤل عن هذا النشاط ',
//                   isHeader: true,
//                 ),
//                 DropdownButtonFormField<int>(
//                   value: bloc.memberId,
//                   items: bloc.memberModel.data?.members
//                           ?.map(
//                             (e) => DropdownMenuItem<int>(
//                               value: e.id,
//                               child: Text(e.arabicName.toString()),
//                             ),
//                           )
//                           .toList() ??
//                       [],
//                   onChanged: (int? value) {
//                     bloc.memberId = value;
//                     print(value);
//                   },
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 16.0,
//                   ),
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//
//                 photoUploadButton(context),
//
//                 MaterialButtonComponent(
//                   onPressed: () {
//                     bloc.add(EditActivityEvent(id: widget.id));
//
//                     print(bloc.dateController.text);
//                   },
//                   child: const Text('اضافة'),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
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
//           bloc.photo != null ?
//           DecorationImage(
//               image: FileImage(bloc.photo!),
//               fit: BoxFit.cover
//           )
//               :
//           null
//       ),
//       child: IconButton(
//         onPressed: () {
//           print("Upload Photo");
//           selectImage(context);
//         },
//         icon: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.photo_library_outlined,
//               color: bloc.photo == null ? Colors.black : Colors.grey.withOpacity(
//                   0.5),),
//             Icon(Icons.upload,
//               color: bloc.photo == null ? Colors.black : Colors.grey.withOpacity(
//                   0.5),),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
