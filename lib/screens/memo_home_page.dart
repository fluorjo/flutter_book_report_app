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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Row(
            children: const <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Text('메모',
                      style: TextStyle(fontSize: 36, color: Colors.blue)))
            ],
          ),
        ],
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

// LoadMemo() {
//   List<Widget> memoList = [];
//   memoList.add(Container(
//     color: Colors.pinkAccent,
//     height: 100,
//   ));
//   return memoList;
// }
