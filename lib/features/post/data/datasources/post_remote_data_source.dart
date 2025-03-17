import 'package:myposts_clean_architecture/features/post/data/models/post_details_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/service/injection_container.dart';
import '../models/post_model.dart';

class PostsRemoteDataSource {
  PostsRemoteDataSource();
  Future<List<PostModel>> getPostsRemoteDataSource() async {
    final response = await sl<ApiConsumer>().get('${EndPoints.newsAPIBaseURL}',
        queryParameters: EndPoints.queryParameters);

    return (response['articles'] as List)
        .map((i) => PostModel.fromJson(i))
        .toList();
  }

  Future<PostDetailsModel> getPostsDetailsRemoteDataSource(int id) async {
    final response = await sl<ApiConsumer>().get(
        '${EndPoints.newsAPIBaseURL}/$id',
        queryParameters: EndPoints.queryParameters);
    return PostDetailsModel.fromJson(response);
  }
}
