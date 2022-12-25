import 'package:book_report/components/logo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const SizedBox(
            height: 200,
          ),
          const Logo("Book Report"),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Get Started"),
          ),
        ]),
      ),
    );
  }
}
