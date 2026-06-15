import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/components/app-text-field.dart';
import '../../../../core/components/text-form-field-information.dart';
import '../../../../core/constant/app_validate.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../domain/bloc/join_bloc.dart';
import 'join -widget.dart';
import 'join-text.dart';
import 'language-selection.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JoinBloc bloc = context.read<JoinBloc>();

    return Form(
      key: bloc.thirdKey,
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: SizeConfig.height40!,
        children: [
          const JoinText(
            text: StringConst.workAndStudy,
            isHeader: true,
          ),
          Text(StringConst.studyQ1,style: normalTextStyle()),
          const JoinSelection(number: 2),
          Text(StringConst.uniQ,style: normalTextStyle()),
          AppTextField(
              controller: bloc.academicSpecializationController,
              textInputType: TextInputType.text,
              hintText: StringConst.uniQ2,
              validate: (value) {
                if (value!.isEmpty) {
                  return StringConst.emptyValidate;
                }
              }
          ),

          Text(StringConst.workQ,style: normalTextStyle()),
          AppTextField(
              controller: bloc.workSpecializationController,
              textInputType: TextInputType.text,
              hintText: StringConst.workQ2,
              validate: (value) {
                if (value!.isEmpty) {
                  return StringConst.emptyValidate;
                }
              }
          ),
          Text(StringConst.langQ,style: normalTextStyle()),
          const Selection(
            numberOfSelection: 1,
          ),
        ],
      ),
    );
  }
}
