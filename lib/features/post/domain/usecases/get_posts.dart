import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/post_entitiy.dart';
import '../repositories/post_repository.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts({required this.repository});

  Future<Either<Failure, List<PostEntity>>> call() {
    return repository.getPosts();
  }
}
