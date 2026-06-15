import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/app-text-field.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import '../../../../core/components/text-form-field-information.dart';
import '../../../../core/constant/app_validate.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/themes/text_style.dart';
import '../../domain/bloc/join_bloc.dart';
import 'join -widget.dart';
import 'join-text.dart';
import 'language-selection.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JoinBloc bloc = context.read<JoinBloc>();

    return Form(
      key: bloc.fourthKey,
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: SizeConfig.height40!,
        children: [
          const JoinText(
            text: StringConst.astronomy,
            isHeader: true,
          ),
          Text(StringConst.astronomyQ,style: normalTextStyle()),
          const JoinSelection(number: 1),
          Text(StringConst.astronomyQ2,style: normalTextStyle()),
          const JoinSelection(number: 3,),
          Text(StringConst.astronomyQ,style: normalTextStyle()),
          const Selection(numberOfSelection: 2,),
          Text(StringConst.astronomyQ4,style: normalTextStyle()),

          AppTextField(
            controller: bloc.progressController,
            validate: MyValidate.nameValidation,
          ),
          Text(StringConst.astronomyQ5,style: normalTextStyle()),

          AppTextField(
            controller: bloc.interestsController,
            validate: MyValidate.nameValidation,
          ),
        ],
      ),
    );
  }
}
