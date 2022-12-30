import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'memo_write_page.dart';
import 'package:book_report/database/memo_db_crud.dart';
import 'package:book_report/database/memo_data_form.dart';

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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 40, bottom: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text('메모',
                  style: TextStyle(fontSize: 36, color: Colors.blue)),
            ),
          ),
          Expanded(child: memoBuilder())
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

Future<List<Memo>> loadMemo() async {
  DBHelper sd = DBHelper();
  return await sd.memos();
}

Widget memoBuilder() {
  return FutureBuilder(
    builder: (context, AsyncSnapshot Snap) {
      if (Snap.data?.isEmpty ?? true) {
        return Container(
          alignment: Alignment.center,
          child: const Text(
            "메모를 추가해보세요",
            style: TextStyle(fontSize: 15, color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
        );
      }
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: Snap.data.length,
        itemBuilder: (context, index) {
          Memo memo = Snap.data[index];
          return Column(
            children: <Widget>[
              Text(memo.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500)),
              Text(memo.text,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w300)),
              Text("최종 수정 시간:${memo.editTime.split('.')[0]}",
                  style: const TextStyle(fontSize: 18)),
            ],
          );
        },
      );
    },
    future: loadMemo(),
  );
}
// LoadMemo() {
//   List<Widget> memoList = [];
//   memoList.add(Container(
//     color: Colors.pinkAccent,
//     height: 100,
//   ));
//   return memoList;
// }
