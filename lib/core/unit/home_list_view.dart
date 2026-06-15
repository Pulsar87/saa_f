import 'package:flutter/material.dart';

class ListTileScreen {
  final String title;
  final IconData icon;
  final String path;

  ListTileScreen({
    required this.title,
    required this.icon,
    required this.path,
  });
}

class ActivityInformation {
  final String name;
  final String id;
  final String description;
  final String age;
  final String date;
  final String image;
  final String place;
  final String memberID;

  ActivityInformation({
    required this.name,
    required this.id,
    required this.description,
    required this.age,
    required this.date,
    required this.image,
    required this.place,
    required this.memberID,
  });
}

class User {
  final String id;
  final String name;
  final String city;
  final String phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.city,
    required this.phoneNumber,
  });
}
