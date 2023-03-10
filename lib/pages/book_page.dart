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
  late TextEditingController _editingController;
  late ScrollController _scrollController;
  int page = 1;

  @override
  void initState() {
    super.initState();
    data = [];
    _editingController = TextEditingController();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        print('다음 페이지');
        page++;
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: "검색어를 입력하세요"),
        ),
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
                  controller: _scrollController,
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
                                SizedBox(
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
          page = 1;
          data.clear;
          getJSONData();
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&query=${_editingController.value.text}';
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
