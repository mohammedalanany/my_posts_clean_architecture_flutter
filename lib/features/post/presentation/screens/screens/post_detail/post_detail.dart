import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/post_detail_entity.dart';
import '../../cubit/posts_cubit.dart';
import '../../cubit/posts_state.dart';

class PostsDetailsScreen extends StatelessWidget {
  static const String routeName = '/posts_details_screen';

  final PostDetailEntity? postDetail;

  const PostsDetailsScreen({Key? key, this.postDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: _buildBody(),
            floatingActionButton: _buildFloatingActionButton(),
          );
        });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndDate(),
          _buildArticleImage(),
          _buildArticleDescription(),
        ],
      ),
    );
  }

  Widget _buildArticleTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            postDetail!.title!,
            style: const TextStyle(
                fontFamily: 'Butler',
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),

          // DateTime
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(postDetail!.urlToImage!, fit: BoxFit.cover),
    );
  }

  Widget _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Text(
        '${postDetail!.description ?? ''}\n\n${postDetail!.content ?? ''}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => (),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }
}
