import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/service/injection_container.dart';
import '../entities/post_detail_entity.dart';
import '../repositories/post_repository.dart';

class GetPostDetailsUseCase {
  Future<Either<Failure, PostDetailEntity>> call(int id) {
    return sl<PostRepository>().getPostDetails(id);
  }
}
