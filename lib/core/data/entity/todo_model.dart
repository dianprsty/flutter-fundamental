// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  int? id;
  String? task;
  String? description;
  bool isCompleted = false;

  TodoModel({
    this.id,
    this.task,
    this.description,
    this.isCompleted = false,
  });

  TodoModel copyWith({
    int? id,
    String? task,
    String? description,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'task': task,
      'description': description,
      'is_completed': isCompleted,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] != null ? map['id'] as int : null,
      task: map['task'] != null ? map['task'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      isCompleted: map['is_completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoModel(id: $id, task: $task, description: $description, is_completed: $isCompleted)';
  }

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.task == task &&
        other.description == description &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        task.hashCode ^
        description.hashCode ^
        isCompleted.hashCode;
  }
}
