import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();

enum Category {
  food,
  leisure,
  travel,
  work,
}

final DateFormat formatter = DateFormat('yyyy-MM-dd');

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.leisure: Icons.sports_football,
  Category.travel: Icons.flight,
  Category.work: Icons.laptop,
};

class Expense {
  Expense({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
