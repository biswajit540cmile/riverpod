
class TodosModel {
  int userId;
  int id;
  String title;
  bool completed;

  TodosModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
//
//  // factory TodosModel.fromRawJson(String str) => TodosModel.fromJson(json.decode(str));
//
//  // String toRawJson() => json.encode(toJson());
//
//   factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
//     userId: json["userId"],
//     id: json["id"],
//     title: json["title"],
//     completed: json["completed"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "id": id,
//     "title": title,
//     "completed": completed,
//   };
 }
