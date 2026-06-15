import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import '../../../../core/components/app-text-field.dart';
import '../../../../core/components/drop_down_button.dart';
import '../../../../core/components/text-form-field-information.dart';
import '../../../../core/constant/app_validate.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/network/local/shared_prefrences_helper.dart';
import '../../../../core/unit/list.dart';
import '../../domain/bloc/join_bloc.dart';
import 'join-text.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    JoinBloc bloc = context.read<JoinBloc>();

    // TODO: implement initState
    bloc.email = SharedPreferencesHelper.getData(key: 'email').toString();

    super.initState();
  }

  // AppConst.emailUser;
  @override
  Widget build(BuildContext context) {
    JoinBloc bloc = context.read<JoinBloc>();

    return Form(
      key: bloc.secondKey,
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: SizeConfig.height40!,
        children: [
          const JoinText(
            text: StringConst.contactInfo,
            isHeader: true,
          ),

          AppTextField(
            hintText: bloc.email!,
            enabled: false,
          ),
          AppTextField(
              controller: bloc.phoneNumberController,
              textInputType: TextInputType.number,
              hintText: StringConst.mobileNum,
            validate: MyValidate.phoneValidate,
          ),

          AppTextField(
              controller: bloc.phoneWhatsappNumberController,
              textInputType: TextInputType.number,
              hintText: StringConst.whatsappNum,
            validate: MyValidate.phoneValidate,
          ),

          CustomDropDownButton(
            options: city,
            selectedOption: bloc.city,
            onChanged: (String? newValue) {
              setState(() {
                bloc.city = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
