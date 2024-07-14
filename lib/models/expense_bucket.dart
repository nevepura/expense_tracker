import 'expense.dart';

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> inpExpenses, this.category)
      : expenses = inpExpenses.where((ex) => ex.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    var total = 0.0;
    for (Expense ex in expenses) {
      total += ex.amount;
    }
    return total;
  }
}
