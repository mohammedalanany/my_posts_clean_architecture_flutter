import 'package:dartz/dartz.dart';
import 'package:myposts_clean_architecture/features/post/data/models/post_model.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/service/injection_container.dart';
import '../../domain/entities/post_detail_entity.dart';
import '../../domain/entities/post_entitiy.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl extends PostRepository {
  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    if (await sl<NetworkInfo>().isConnected!) {
      try {
        final List<PostEntity> remotePost =
            await sl<PostsRemoteDataSource>().getPostsRemoteDataSource();
        return Right(remotePost as List<PostModel>);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localPost = await sl<PostLocalDataSource>().getLastPost();
        return Right(localPost as List<PostEntity>);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }

  @override
  Future<Either<Failure, PostDetailEntity>> getPostDetails(int id) async {
    if (await sl<NetworkInfo>().isConnected!) {
      try {
        final PostDetailEntity remotePostDetails =
            await sl<PostsRemoteDataSource>()
                .getPostsDetailsRemoteDataSource(id);
        return Right(remotePostDetails);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No internet connection"));
    }
  }
}
