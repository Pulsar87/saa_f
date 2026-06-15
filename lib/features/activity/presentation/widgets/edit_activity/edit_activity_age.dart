import 'package:flutter/material.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_bloc.dart';

import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../../../core/unit/list.dart';

class EditActivityAge extends StatefulWidget {
  EditActivityAge({super.key, required this.activityBloc, });
  final ActivityBloc activityBloc;
  @override
  State<EditActivityAge> createState() => _EditActivityAgeState();
}

class _EditActivityAgeState extends State<EditActivityAge> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text( "الفئة العمرية",style: normalTextStyle(fontSize: 18),),
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
                value:  widget.activityBloc.editLocalAge,
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
                    widget.activityBloc.editLocalAge =value!;
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
