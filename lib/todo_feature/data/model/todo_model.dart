class TodoModel {
  int userId;
  int id;
  String title;
  bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,});

  TodoModel.fromJson(Map<String, dynamic> json)
      : userId = json["userId"] ?? -1,
        id = json["id"] ?? -1,
        title = json["title"] ?? "",
        completed = json["completed"] ?? false;


}