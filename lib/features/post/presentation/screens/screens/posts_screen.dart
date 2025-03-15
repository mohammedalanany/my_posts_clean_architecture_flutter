import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/posts_cubit.dart';
import '../cubit/posts_state.dart';
import '../widgets/post_tile.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('My Posts'),
          ),
          body: state is GetPostsSuccessfully
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return PostWidget(
                      post: state.posts[index],
                    );
                  },
                  itemCount: state.posts.length,
                )
              : state is GetPostsFailure
                  ? Text(state.errMessage)
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
