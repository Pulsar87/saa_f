import 'package:flutter/material.dart';

class JoinRadio extends StatelessWidget {
  final String text;
  final dynamic value;
  final dynamic groupValue;

  final ValueChanged<dynamic>? onChanged;

  const JoinRadio({
    super.key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Text(text,
              style: const TextStyle(
                fontSize: 20,
              )),
          Radio<dynamic>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
