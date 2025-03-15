import 'dart:convert';

import '../../../../core/databases/cache/cache_helper.dart';
import '../../../../core/errors/expentions.dart';
import '../../domain/entities/post_entitiy.dart';
import '../models/post_model.dart';

class PostLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedPosts";
  PostLocalDataSource({required this.cache});

  cachePost(List<PostEntity> postToCache) {
    cache.saveData(
      key: key,
      value: postToCache.toList(),
    );
  }

  Future<PostModel> getLastPost() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      return Future.value(PostModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
