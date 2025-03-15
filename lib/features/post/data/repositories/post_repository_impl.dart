import 'package:dartz/dartz.dart';
import 'package:myposts_clean_architecture/features/post/data/models/post_model.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/post_entitiy.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl extends PostRepository {
  final NetworkInfo networkInfo;
  final PostsRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  PostRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    if (await networkInfo.isConnected!) {
      try {
        final List<PostEntity> remotePost =
            await remoteDataSource.getPostsRemoteDataSource();
        return Right(remotePost as List<PostModel>);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localPost = await localDataSource.getLastPost();
        return Right(localPost as List<PostEntity>);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
