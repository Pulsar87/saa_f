import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String?)? onChanged;
  const CustomDropDownButton(
      {Key? key,
      required this.options,
      required this.selectedOption,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Take full width of the screen
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        value: selectedOption,
        onChanged: onChanged,
        isExpanded: true, // Make the dropdown button fill the width
        style: const TextStyle(
          color: Colors.black, // Customize the text color
          fontSize: 16.0, // Customize the text size
        ),
        icon: const Icon(
          Icons.arrow_drop_down, // Customize the dropdown icon
          color: Colors.black,
        ),
        iconSize: 24.0,
        underline: const SizedBox(), // Hide the default underline
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option,style: normalTextStyle(fontWeight: FontWeight.w200),),
          );
        }).toList(),
      ),
    );
  }
}
