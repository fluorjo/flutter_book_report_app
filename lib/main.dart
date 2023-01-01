import 'package:book_report/pages/home_page.dart';
import 'package:book_report/pages/login_page.dart';
import 'package:book_report/pages/book_page.dart';
import 'package:book_report/pages/memo_main_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:book_report/screens/login_screen_splash.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:book_report/screens/event_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    testData();
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
      initialRoute: "/login",
      routes: {
        //   "/": (context) => loginSplashScreen(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/bookinfo": (context) => BookPage(),
        "/memomain": (context) => MemoPage(),
        "/EventScreen": (context) => EventScreen(),
      },
    );
  }

  Future testData() async {
    await Firebase.initializeApp();
    FirebaseFirestore db = FirebaseFirestore.instance;
    var data = await db.collection('event_details').get();
    var details = data.docs.toList();

    for (var d in details) {
      print(d.id);
    }
  }
}
