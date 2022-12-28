import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'dart:convert';

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
        onPressed: () {
          getJSONData();
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
//    var response = await http.get(Uri.parse(url));
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK cc88f89bd0a8b58cce4d732fac88b0e8"});
    print(response.body);
    return "성공";
  }
}
