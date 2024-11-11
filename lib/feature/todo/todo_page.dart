import 'package:flutter/material.dart';
import 'package:flutter_fundamental/core/data/entity/todo_model.dart';
import 'package:flutter_fundamental/core/data/local/sqflite/database_instance.dart';
import 'package:flutter_fundamental/feature/todo/todo_form.dart';
import 'package:sqflite/sqflite.dart';

class Todopage extends StatefulWidget {
  const Todopage({super.key});

  @override
  State<Todopage> createState() => _TodopageState();
}

class _TodopageState extends State<Todopage> {
  DatabaseInstance database = DatabaseInstance();
  List<TodoModel> listTodo = [];

  @override
  void initState() {
    _initDB();
    super.initState();
  }

  _initDB() async {
    await database.database;
    listTodo = await database.getAllTodo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          // _initDB();
        });
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Todo List'),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoForm(),
                  )).then(
                (value) => setState(() {}),
              );
            },
            child: const Icon(Icons.edit, color: Colors.white),
          ),
          body: listTodo.length == 0
              ? const Center(
                  child: Text('Todo'),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(listTodo[index].task!),
                          tileColor: Colors.blue.shade100,
                        );
                      },
                      itemCount: listTodo.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          )),
                )),
    );
  }
}
