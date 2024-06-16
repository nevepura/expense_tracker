import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Potato",
      category: Category.food,
      amount: 0.3,
      date: DateTime.now(),
    ),
    Expense(
      title: "Salad",
      category: Category.food,
      amount: 8.5,
      date: DateTime.now(),
    ),
    Expense(
      title: "Road trip",
      category: Category.travel,
      amount: 50,
      date: DateTime.now(),
    ),
    Expense(
      title: "Cables",
      category: Category.work,
      amount: 12.99,
      date: DateTime.now(),
    ),
    Expense(
      title: "Toys",
      category: Category.leisure,
      amount: 25,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The amazing XpenZ app"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text("put Chart here"),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
