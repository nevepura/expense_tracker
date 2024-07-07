import 'package:expense_tracker/widgets/expenses_list/new_expense.dart';
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

  void addExpense(Expense expense) {
    setState(() => _registeredExpenses.add(expense));
  }

  void removeExpense(Expense exp) {
    int removedIndex = _registeredExpenses.indexOf(exp);
    setState(() {
      _registeredExpenses.remove(exp);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Deleted expense: ${exp.title}"),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(removedIndex, exp);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (sheetCtx) => NewExpense(onAddExpense: addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Text("No expenses yet");
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("The amazing XpenZ app"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text("put Chart here"),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
