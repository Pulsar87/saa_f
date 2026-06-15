import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/material-button-componat.dart';
import 'package:saa_f/core/components/text_form_field.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/components/app-text-field.dart';
import '../../../../core/components/text-form-field-information.dart';
import '../../../../core/constant/app_validate.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/unit/date-picker.dart';
import '../../domain/bloc/join_bloc.dart';
import 'join-text.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  void _onDateButtonPressed(BuildContext context) async {
    JoinBloc bloc = context.read<JoinBloc>();
    final DateTime? pickedDate =
        await DatePickerUtils.selectDate(context, bloc.selectedDate);
    if (pickedDate != null) {
      DatePickerUtils.handleDateSelection(pickedDate, bloc.birthdayController);
   }
  }

  @override
  Widget build(BuildContext context) {
    JoinBloc bloc = context.read<JoinBloc>();

    return Form(
      key: bloc.firstKey,
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: SizeConfig.height40!,
        children: [
          const JoinText(
            text: StringConst.personalInfo,
            isHeader: true,
          ),
          AppTextField(
              controller: bloc.nameArabicController,
              textInputType: TextInputType.text,
              hintText: StringConst.arbicName,
              validate: (value) {
                if (value!.isEmpty) {
                return StringConst.emptyValidate;
              }
            }
          ),
          AppTextField(
              controller: bloc.nameEnglishController,
              textInputType: TextInputType.text,
              hintText: StringConst.englishName,
              validate: (value) {
                if (value!.isEmpty) {
                  return StringConst.emptyValidate;
                }
              }
          ),
          AppTextField(
              controller: bloc.fatherController,
              textInputType: TextInputType.text,
              hintText: StringConst.fatherName,
              validate: (value) {
                if (value!.isEmpty) {
                  return StringConst.emptyValidate;
                }
              }
          ),
          AppTextField(
              controller: bloc.nationalityController,
              textInputType: TextInputType.text,
              hintText: StringConst.nationality,
              validate: (value) {
                if (value!.isEmpty) {
                  return StringConst.emptyValidate;
                }
              }
          ),
          Row(
            children: [
              
              Expanded(
                  child: MaterialButtonComponent(
                    onPressed:() => _onDateButtonPressed(context),
                    child: Text(
                      StringConst.birthDate,
                      style: buttonTextStyle(),
                    ),
                  )
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap:() => _onDateButtonPressed(context),
                  child: TextFormFieldComponent(
                    enabled: false,
                    // hintText: 'تاريخ الميلاد',
                    // isChanged: true,
                    controller: bloc.birthdayController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "";
                        }
                      }
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
