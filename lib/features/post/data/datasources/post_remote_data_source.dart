import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../models/post_model.dart';

class PostsRemoteDataSource {
  final ApiConsumer api;

  PostsRemoteDataSource({required this.api});
  Future<List<PostModel>> getPostsRemoteDataSource() async {
    final response = await api.get('${EndPoints.newsAPIBaseURL}',
        queryParameters: EndPoints.queryParameters);
    print(response['articles']);

    return (response['articles'] as List)
        .map((i) => PostModel.fromJson(i))
        .toList();
  }
}
