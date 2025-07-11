import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { wedding, graduation, family_reunion, baby_shower, custom }

enum Time { am, pm }

const categoryItems = {
  Category.wedding: Icons.sunny,
  Category.graduation: Icons.mode_night_sharp,
  Category.family_reunion: Icons.ac_unit_rounded,
  Category.baby_shower: Icons.toys,
  Category.custom: Icons.brush
};

const time = {Time.am: Icons.sunny, Time.pm: Icons.nights_stay};

class Event {
  Event({
    required this.title,
    required this.clock,
    required this.minutes,
    required this.date,
    required this.category,
    required this.time,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double clock;
  final int minutes;
  final DateTime date;
  final Category category;
  final Time time;

  String get formmatedDate {
    return formatter.format(date);
  }
}
