import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  State<HttpApp> createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http example'),
      ),
      body: Container(
        child: Center(
          child: Text(result),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var url = 'http://www.google.com';
          var response = await http.get(Uri.parse(url));
          setState(() {
            result = response.body;
          });
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }
}
