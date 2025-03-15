import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposts_clean_architecture/core/connection/network_info.dart';
import 'package:myposts_clean_architecture/core/databases/api/dio_consumer.dart';
import 'package:myposts_clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:myposts_clean_architecture/features/post/presentation/screens/cubit/posts_state.dart';

import '../../../data/datasources/post_local_data_source.dart';
import '../../../data/datasources/post_remote_data_source.dart';
import '../../../data/repositories/post_repository_impl.dart';
import '../../../domain/usecases/get_posts.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  eitherFailureOrUser() async {
    emit(GetPostsLoading());
    final failureOrUser = await GetPosts(
      repository: PostRepositoryImpl(
          remoteDataSource: PostsRemoteDataSource(api: DioConsumer(dio: Dio())),
          localDataSource: PostLocalDataSource(cache: CacheHelper()),
          networkInfo: NetworkInfoImpl(DataConnectionChecker())),
    ).call();

    failureOrUser.fold(
      (failure) => emit(GetPostsFailure(errMessage: failure.errMessage)),
      (post) => emit(GetPostsSuccessfully(posts: post)),
    );
  }
}
