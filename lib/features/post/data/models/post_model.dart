import '../../domain/entities/post_entitiy.dart';

class PostModel extends PostEntity {
  //هنا الkeys  اللى بترجع فى الموديل وانتا مش ضايفها فى  entety
  final int userId;

  PostModel({
    required super.id,
    required super.title,
    required super.body,
    required this.userId,
  });
//بخزن هنا الداتا اللى جايه من  api
  factory PostModel.fromJson(Map<dynamic, dynamic> json) {
    return PostModel(
        id: json['id'], // json["id"]ممكن عادى نكتبها
        title: json['title'],
        body: json['body'],
        userId: json['userId']);
  }
//دى بخزن الداتا فى الكاش للجهاز
  Map<dynamic, dynamic> toJson() {
    return {
      id: id, // json["id"]ممكن عادى نكتبها
      title: title,
      body: body,
      userId: userId
    };
  }
}
