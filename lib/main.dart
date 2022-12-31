import 'package:book_report/pages/home_page.dart';
import 'package:book_report/pages/login_page.dart';
import 'package:book_report/pages/book_page.dart';
import 'package:book_report/pages/memo_main_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            minimumSize: const Size(400, 60),
          ),
        ),
      ),
      initialRoute: "/home",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/bookinfo": (context) => BookPage(),
        "/memomain": (context) => MemoPage(),
        // "/memoview": (context) => memoViewPage(),
      },
    );
  }
}
