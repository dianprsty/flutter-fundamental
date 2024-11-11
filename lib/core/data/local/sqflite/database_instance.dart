import 'dart:io';

import 'package:flutter_fundamental/core/data/entity/todo_model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final String _dbtask = "myapp.db";
  final int _dbversion = 1;

  // tabel Todo
  final String tableTodo = "todo";
  final String columnId = "id";
  final String columnTask = "task";
  final String columnDescription = "description";
  final String columnIsCompleted = "is_completed";

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(documentsDirectory.path, _dbtask);
    return openDatabase(path, version: _dbversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableTodo (
        $columnId INTEGER PRIMARY KEY, 
        $columnTask TEXT NULL, 
        $columnDescription TEXT NULL, 
        $columnIsCompleted BOOLEAN NUL)
        ''');
  }

  Future<List<TodoModel>> getAllTodo() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableTodo);
    return List.generate(maps.length, (index) {
      return TodoModel(
        id: maps[index][columnId],
        task: maps[index][columnTask],
        description: maps[index][columnDescription],
        // isCompleted: maps[index][columnIsCompleted],
      );
    });
  }

  Future<TodoModel> getTodoById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(tableTodo, where: "$columnId = ?", whereArgs: [id]);
    return TodoModel(
      id: maps[0][columnId],
      task: maps[0][columnTask],
      description: maps[0][columnDescription],
      // isCompleted: maps[0][columnIsCompleted],
    );
  }

  Future<int> insertTodo(TodoModel todo) async {
    final db = await database;
    return await db.insert(tableTodo, todo.toMap());
  }

  Future<int> updateTodo(TodoModel todo) async {
    final db = await database;
    return await db.update(tableTodo, todo.toMap(),
        where: "$columnId = ?", whereArgs: [todo.id]);
  }

  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete(tableTodo, where: "$columnId = ?", whereArgs: [id]);
  }
}
