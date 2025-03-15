//دى state  الموجوده بالصفحه

import '../../../domain/entities/post_entitiy.dart';

class PostsState {}

final class PostsInitial extends PostsState {} //دى الافتراضيه

final class GetPostsSuccessfully extends PostsState {
  final List<PostEntity> posts;

  GetPostsSuccessfully({required this.posts});
} //دى فى حالة نجاح انه يجيب اليوزر

final class GetPostsLoading extends PostsState {} //دى فى حالة التحميل

final class GetPostsFailure extends PostsState {
  final String errMessage;

  GetPostsFailure({required this.errMessage});
} //دى فى حالة لو حصل خطأ
