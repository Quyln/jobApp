class Task {
  final String title;
  bool completed;
  String name;
  String content;
  Task(
      {required this.title,
      required this.completed,
      required this.content,
      required this.name});

  static Task fromJson(dynamic data) {
    return Task(
        title: data['title'],
        completed: data['completed'],
        content: data['content'],
        name: data['name']);
  }
}
