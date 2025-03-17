import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/post_detail_entity.dart';
import '../entities/post_entitiy.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, PostDetailEntity>> getPostDetails(int id);
}
