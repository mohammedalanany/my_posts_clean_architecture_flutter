import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposts_clean_architecture/features/post/presentation/screens/cubit/posts_state.dart';
;
import '../../../domain/usecases/get_posts.dart';
import '../../../domain/usecases/get_posts_details.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  eitherFailureOrUser() async {
    emit(GetPostsLoading());
    final failureOrUser = await GetPosts().call();

    failureOrUser.fold(
      (failure) => emit(GetPostsFailure(errMessage: failure.errMessage)),
      (post) => emit(GetPostsSuccessfully(posts: post)),
    );
  }

  eitherFailureOrGetPostDetails() async {
    emit(GetPostsDetailsLoading());
    final failureOrGetPostDetails = await GetPostDetailsUseCase().call(1);

    failureOrGetPostDetails.fold(
      (failure) => emit(GetPostsDetailsFailure(errMessage: failure.errMessage)),
      (postDetails) =>
          emit(GetPostsDetailsSuccessfully(postsDetails: postDetails)),
    );
  }
}
