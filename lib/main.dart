import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 100, 94, 94),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Expenses(),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          backgroundColor: kColorScheme.tertiary,
          actionTextColor: kColorScheme.onTertiaryContainer,
          actionBackgroundColor: kColorScheme.tertiaryContainer,
          contentTextStyle: const TextStyle().copyWith(
            color: kColorScheme.onTertiary,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
