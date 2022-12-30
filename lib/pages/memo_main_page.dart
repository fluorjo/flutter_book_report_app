import 'package:flutter/material.dart';
import 'package:book_report/screens/memo_home_page.dart';

class MemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: memoHomePage(
          // appBar: AppBar(
          //   elevation: 1,
          //   foregroundColor: Colors.black,
          //   backgroundColor: Colors.white,
          //   centerTitle: true,
          //   title: const Text(
          //     "메모 메인 페이지",
          //     style: TextStyle(
          //       fontSize: 22,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
