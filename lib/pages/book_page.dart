import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http example'),
      ),
      body: Container(
        child: Center(
          child: data.isEmpty
              ? const Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.network(
                              data[index]['thumbnail'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Text(
                                    data[index]['title'].toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                    '저자 :${data[index]['authors'].toString()}'),
                                Text(
                                    '가격 :${data[index]['sale_price'].toString()}'),
                                Text(
                                    '판매상태 :${data[index]['status'].toString()}'),
                              ],
                            )
                          ],
          
                        ),
                      ),
                    );
                  },
                ),
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
    const apikey = 'cc88f89bd0a8b58cce4d732fac88b0e8';
    var response = await http
        .get(Uri.parse(url), headers: {"Authorization": "KakaoAK $apikey"});
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data.addAll(result);
    });
    return response.body;
  }
}
