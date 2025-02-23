import 'package:todo_app/domain/models/todo_model.dart';

abstract class TodoRepo {
  // get list of todos
  Future<List<TodoModel>> getAllTodos();
  // add a new todo
  Future<void> addTodo(TodoModel newTodo);
  // update an existing todo
  Future<void> updateTodo(TodoModel todo);
  // delete todo
  Future<void> deleteTodo(TodoModel todo);

}
