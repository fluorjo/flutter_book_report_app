import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:book_report/screens/memo_edit_page.dart';
import 'package:book_report/database/memo_db_crud.dart';
import 'package:book_report/database/memo_data_form.dart';

class memoViewPage extends StatefulWidget {
  const memoViewPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _memoViewPageState createState() => _memoViewPageState();
}

class _memoViewPageState extends State<memoViewPage> {
  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: showAlertDialog,
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => memoEditPage(id: widget.id)));
            },
            // Snap.databb?.isEmpty ?? true
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(20), child: loadBuilder()),
    );
  }

  Future<List<Memo>> loadMemo(String id) async {
    DBHelper sd = DBHelper();

    return await sd.findMemo(id);
  }

  loadBuilder() {
    return FutureBuilder<List<Memo>>(
      future: loadMemo(widget.id),
      builder: (BuildContext context, AsyncSnapshot<List<Memo>> snapshot) {
        if (snapshot.data == null || snapshot.data == []) {
          return Container(child: const Text("데이터를 불러올 수 없습니다."));
        } else {
          Memo memo = snapshot.data![0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 70,
                child: SingleChildScrollView(
                  child: Text(
                    memo.title,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Text(
                "메모 만든 시간: ${memo.createTime.split('.')[0]}",
                style: const TextStyle(fontSize: 11),
                textAlign: TextAlign.end,
              ),
              Text(
                "메모 수정 시간: ${memo.editTime.split('.')[0]}",
                style: const TextStyle(fontSize: 11),
                textAlign: TextAlign.end,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(memo.text),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    await sd.deleteMemo(id);
  }

  void showAlertDialog() async {
    await showDialog(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('삭제 경고'),
          content: const Text("정말 삭제하시겠습니까?\n삭제된 메모는 복구되지 않습니다."),
          actions: <Widget>[
            TextButton(
              child: const Text('삭제'),
              onPressed: () {
                Navigator.pop(context, "삭제");
                deleteMemo(widget.id);
                Navigator.pop(_context);
              },
            ),
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.pop(context, "취소");
              },
            ),
          ],
        );
      },
    );
  }
}
