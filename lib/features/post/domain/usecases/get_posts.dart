import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/service/injection_container.dart';
import '../entities/post_entitiy.dart';
import '../repositories/post_repository.dart';

class GetPosts {
  Future<Either<Failure, List<PostEntity>>> call() {
    return sl<PostRepository>().getPosts();
  }
}
