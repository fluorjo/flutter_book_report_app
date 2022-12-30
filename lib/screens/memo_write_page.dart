import 'package:book_report/database/memo_db_crud.dart';
import 'package:flutter/material.dart';
import 'package:book_report/database/memo_data_form.dart';

import 'package:crypto/crypto.dart';
import 'dart:convert';

class memoWritePage extends StatelessWidget {
  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: saveDB,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String title) {
                this.title = title;
              },
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: '메모 제목을 입력해주세요',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              onChanged: (String text) {
                this.text = text;
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(hintText: '메모 내용을 입력해주세요'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
      id: Str25ha512(DateTime.now().toString()),
      title: title,
      text: text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
  }

  String Str25ha512(String text) {
    var bytes = utf8.encode(text);
    var digest = sha512.convert(bytes);
    return digest.toString();
  }
}
