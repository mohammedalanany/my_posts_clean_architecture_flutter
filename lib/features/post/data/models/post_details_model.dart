import 'package:myposts_clean_architecture/core/databases/api/end_points.dart';

import '../../domain/entities/post_detail_entity.dart';

//هنا الkeys  اللى بترجع فى الموديل وانتا مش ضايفها فى  entety
class PostDetailsModel extends PostDetailEntity {
  const PostDetailsModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory PostDetailsModel.fromJson(Map<String, dynamic> map) {
    return PostDetailsModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != ""
          ? map['urlToImage']
          : EndPoints.kDefaultImage,
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }

  factory PostDetailsModel.fromEntity(PostDetailsModel entity) {
    return PostDetailsModel(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content);
  }
}
