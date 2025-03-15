import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/post_entitiy.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}
