import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:book_report/database/memo_data_form.dart';

const String TableName = 'memos';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      //데이터베이스 경로 지정
      join(await getDatabasesPath(), 'memos.db'),
      //데이터베이스 생성시 메모를 저장할 테이블을 생성
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE memos(id INTEGER PRIMARY KEY, title TEXT, text TEXT, createTime TEXT, editTime TEXT)",
        );
      },
      //oncreate 함수에서 수행되며 데이터베이스의 업/다운그레이드를 수행하기 위한 경로를 제공
      version: 1,
    );
    return _db;
  }

  Future<void> insertMemo(Memo memo) async {
    final db = await database;

    await db.insert(
      TableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Memo>> memos() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('memos');

    return List.generate(maps.length, (i) {
      return Memo(
        id: int.parse(maps[i]['id']),
        title: maps[i]['title'],
        text: maps[i]['text'],
        createTime: maps[i]['createTime'],
        editTime: maps[i]['editTime'],
      );
    });
  }

  Future<void> updateMemo(Memo memo) async {
    final db = await database;

    await db.update(
      TableName,
      memo.toMap(),
      where: "id=?",
      whereArgs: [memo.id],
    );
  }

  Future<void> deleteMemo(int id) async {
    final db = await database;

    await db.delete(
      TableName,
      where: "id=?",
      whereArgs: [id],
    );
  }
}
