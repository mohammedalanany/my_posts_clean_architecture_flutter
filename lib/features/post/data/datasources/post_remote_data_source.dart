import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../models/post_model.dart';

class PostsRemoteDataSource {
  final ApiConsumer api;

  PostsRemoteDataSource({required this.api});
  Future<List<PostModel>> getPostsRemoteDataSource() async {
    final response = await api.get("${EndPoints.post}");
    print(response);
    return (response as List).map((i) => PostModel.fromJson(i)).toList();
  }
}
