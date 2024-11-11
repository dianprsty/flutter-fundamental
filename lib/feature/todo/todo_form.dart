import 'package:flutter/material.dart';
import 'package:flutter_fundamental/core/data/entity/todo_model.dart';
import 'package:flutter_fundamental/core/data/local/sqflite/database_instance.dart';
import 'package:flutter_fundamental/core/widget/custom_text_field.dart';
import 'package:flutter_fundamental/core/widget/primary_button.dart';

class TodoForm extends StatefulWidget {
  final TodoModel? todo;
  const TodoForm({super.key, this.todo});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _taskController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isCompleted = false;

  DatabaseInstance database = DatabaseInstance();

  @override
  void initState() {
    database.database;
    super.initState();
    if (widget.todo != null) {
      _taskController.text = widget.todo!.task ?? '';
      _descriptionController.text = widget.todo!.description ?? '';
      _isCompleted = widget.todo!.isCompleted;
    }
  }

  @override
  void dispose() {
    _taskController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo Form'),
        ),
        body: ListView(padding: const EdgeInsets.all(16), children: [
          CustomTextField(
            label: 'Title',
            controller: _taskController,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Content',
            controller: _descriptionController,
            minLines: 5,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Switch(
                value: _isCompleted,
                onChanged: (value) {
                  setState(() {
                    _isCompleted = !_isCompleted;
                  });
                },
              ),
              SizedBox(width: 8),
              Text(
                _isCompleted ? 'Completed' : 'On Progress',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            onPressed: () async {
              TodoModel todo = TodoModel(
                task: _taskController.text,
                description: _descriptionController.text,
                isCompleted: _isCompleted,
              );

              await database.insertTodo(todo).then((todoId) {
                Navigator.pop(context);
              });
            },
            child: const Text(
              'Save Todo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]));
  }
}
