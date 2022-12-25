
  runApp(MaterialApp(home: MyAppHome(), routes: <String, WidgetBuilder>{
    '/a': (BuildContext) => MyPage(title: 'page A'),
    '/b': (BuildContext) => MyPage(title: 'page B'),
    '/c': (BuildContext) => MyPage(title: 'page C'),
  }));