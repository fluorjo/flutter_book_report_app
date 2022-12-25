import 'package:book_report/components/custom_text_form_field.dart';
import 'package:book_report/size.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const CustomTextFormField("Email"),
          const SizedBox(
            height: medium_gap,
          ),
          const CustomTextFormField("Password"),
          const SizedBox(
            height: large_gap,
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/home");
              }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
