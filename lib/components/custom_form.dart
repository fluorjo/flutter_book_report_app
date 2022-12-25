import 'package:book_report/components/custom_text_form_field.dart';
import 'package:book_report/size.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomTextFormField("Email"),
        SizedBox(
          height: medium_gap,
        ),
        CustomTextFormField("Password"),
        SizedBox(
          height: large_gap,
        ),
      ],
    );
  }
}
