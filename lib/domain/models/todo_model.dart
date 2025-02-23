class TodoModel {
  final String id;
  final String text;
  final bool isCompleted;

  TodoModel({required this.id, required this.text, this.isCompleted = false});
  // toggle completion on & off
  TodoModel toggleCompelation() {
    return TodoModel(id: id, text: text, isCompleted: !isCompleted);
  }
}
