import 'package:flutter/material.dart';

class memoViewPage extends StatelessWidget {
  const memoViewPage({Key? key, this.id}) : super(key: key);

  final String? id;

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
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const <Widget>[
            Text('text1'),
            Padding(padding: EdgeInsets.all(10)),
            Text('text1'),
          ],
        ),
      ),
    );
  }
}
