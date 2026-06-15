import 'package:flutter/material.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';

import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../../../core/unit/list.dart';

class AddActivityAge extends StatefulWidget {
   AddActivityAge({super.key, this.isEdit = false});
  bool isEdit;
  @override
  State<AddActivityAge> createState() => _AddActivityAgeState();
}

class _AddActivityAgeState extends State<AddActivityAge> {
  @override
  Widget build(BuildContext context) {
return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text( widget.isEdit? "تعديل الفئة العمرية ":"الفئة العمرية",style: normalTextStyle(fontSize: 18),),
      SizedBox(width: 10,),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey,
                width: 2
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          // width: double.infinity,
          alignment: Alignment.topCenter,
          child: DropdownButton<String>(
            value: ages[4],
            items: ages.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    value,
                    style: normalTextStyle(fontSize: 18),),
                ),
              );
            }).toList(),
            elevation: 1,
            onChanged: (value) {
              setState(() {
                ActivityBloc.localAge = value!;
                print("selectedDrop ${ActivityBloc.localAge}");
                (context as Element).markNeedsBuild();

              });
            },
          ),
        ),
      ),
    ],
  ),
);
  }
}
