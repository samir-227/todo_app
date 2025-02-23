/*

Todo Isar Model

Converts todo model into isar todo model that we can store in our isar database.

*/
import 'package:isar/isar.dart';
import 'package:todo_app/domain/models/todo_model.dart';
part 'isar_model.g.dart';

@collection
class TodoIsarModel {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // convert isar model to pure to todo model to use it in the domain layer.
  TodoModel toDomain() {
    return TodoModel(id: id, text: text, isCompleted: isCompleted);
  }

  // convert todo model to isar object to store in isar database.
  static TodoIsarModel fromDomain(TodoModel todo){
     return TodoIsarModel()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
   
  }
}
