import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerUtils {
  DatePickerUtils._(); // Private constructor to prevent instantiation.

  static Future<DateTime?> selectDate(
      BuildContext context, DateTime? initialDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
    );
  }

  static void handleDateSelection(
      DateTime pickedDate, TextEditingController birthdayController) {
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      birthdayController.text = formattedDate;
    }
  }

  static void handleDateSelectionWithTime(
      DateTime pickedDate, TextEditingController birthdayController) {
    if (pickedDate != null) {
      String formattedDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(pickedDate);
      birthdayController.text = formattedDate;
    }
  }

  static Future<void> handleDateTimeSelection(
      BuildContext context, TextEditingController dateTimeController) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),

    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        String formattedDateTime =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(pickedDateTime);
        dateTimeController.text = formattedDateTime;
      }
    }
  }
}
