class Todo {
  final String title;
  final int id;
  final int userId;
  final bool completed;

  Todo(this.title, this.id, this.userId, this.completed);

  factory Todo.fromJson(Map json) {
    return Todo(json["title"], json["id"], json["userId"], json["completed"]);
  }

  Map toJson() {
    return {"id": id, "title": title, "userId": userId, "completed": completed};
  }
}
