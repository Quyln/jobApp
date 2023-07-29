class Task {
  final String title;
  bool completed;

  Task({required this.title, required this.completed});

  static Task fromJson(dynamic data) {
    return Task(title: data['title'], completed: data['completed']);
  }
}
