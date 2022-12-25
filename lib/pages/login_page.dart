import 'package:book_report/components/custom_form.dart';
import 'package:book_report/components/logo.dart';
import 'package:book_report/size.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: xlarge_gap),
            const Logo("Login"),
            const SizedBox(height: large_gap),
            CustomForm(),
          ],
        ),
      ),
    );
  }
}
