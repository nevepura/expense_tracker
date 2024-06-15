import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, leisure, travel, work }

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
}
