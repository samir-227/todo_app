/*
DATABASE REPO
This implements the todo repo.
*/
import 'package:isar/isar.dart';
import 'package:todo_app/data/models/isar_model.dart';
import 'package:todo_app/domain/models/todo_model.dart';
import 'package:todo_app/domain/repository/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  final Isar db;

  TodoRepoImpl(this.db);
  @override
  Future<void> addTodo(TodoModel newTodo) async {
    // convert todo into todo isar model
    final isarTodo = TodoIsarModel.fromDomain(newTodo);
    /* todoIsarModels is a IsarCollection<TodoIsarModel>
       - its a the todos collection in isar database.
    */
    return db.writeTxn(() => db.todoIsarModels.put(isarTodo));
  }

  @override
  Future<void> deleteTodo(TodoModel todo) async {
    return db.writeTxn(() => db.todoIsarModels.delete(todo.id));
   
  }

  @override
  Future<List<TodoModel>> getAllTodos() async {
    // fetch data from db
    final todos = await db.todoIsarModels.where().findAll();
    // return as a list of todos and give to domain layer
    return todos.map((todoIsarModels) => todoIsarModels.toDomain()).toList();
  }

  @override
  Future<void> updateTodo(TodoModel todo) {
    final isarTodo = TodoIsarModel.fromDomain(todo);
    return db.writeTxn(() => db.todoIsarModels.put(isarTodo));
  }
}
