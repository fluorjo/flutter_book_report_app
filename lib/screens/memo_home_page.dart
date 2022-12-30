import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'memo_write_page.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => memoWritePage()));
        },
        tooltip: '메모 추가',
        label: const Text("메모 추가"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
