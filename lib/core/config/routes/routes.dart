import 'package:flutter/material.dart';
import 'package:myposts_clean_architecture/features/post/presentation/screens/screens/posts_screen.dart';

import '../../../features/post/presentation/screens/screens/post_detail/post_detail.dart';

class Routes {
  static const initialRoute = PostsScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    PostsScreen.routeName: (_) => const PostsScreen(),
    PostsDetailsScreen.routeName: (_) => const PostsDetailsScreen(),
  };
}
