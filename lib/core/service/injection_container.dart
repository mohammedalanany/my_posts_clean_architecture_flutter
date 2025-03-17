import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/post/data/datasources/post_local_data_source.dart';
import '../../features/post/data/datasources/post_remote_data_source.dart';
import '../../features/post/domain/repositories/post_repository.dart';
import '../connection/network_info.dart';
import '../databases/api/api_consumer.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Data sources
  sl.registerSingleton<ApiConsumer>((sl()));
  sl.registerSingleton<NetworkInfo>((sl()));
  sl.registerSingleton<PostsRemoteDataSource>((sl()));
  sl.registerSingleton<PostLocalDataSource>((sl()));

  // Repository
  sl.registerSingleton<PostRepository>((sl()));

  // Use cases
  sl.registerLazySingleton(() => GetArticleUseCase(sl()));

  sl.registerLazySingleton(() => GetSavedArticleUseCase(sl()));

  sl.registerLazySingleton(() => SaveArticleUseCase(sl()));

  sl.registerLazySingleton(() => RemoveArticleUseCase(sl()));

  // Blocs
  sl.registerFactory(() => RemoteArticlesBloc(sl()));

  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
