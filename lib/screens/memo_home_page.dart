import 'package:flutter/material.dart';

class memoHomePage extends StatefulWidget {
  const memoHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _memoHomePageState createState() => _memoHomePageState();
}

class _memoHomePageState extends State<memoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sddd'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '이 버튼 여러 번 누름:',
            ),
          ],
        ),
      ),
    );
  }
}
