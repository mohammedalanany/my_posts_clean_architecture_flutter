import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposts_clean_architecture/core/databases/cache/cache_helper.dart';

import 'features/post/presentation/screens/cubit/posts_cubit.dart';
import 'features/post/presentation/screens/screens/posts_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostsCubit()..eitherFailureOrUser(),
        child: const PostsScreen(),
      ),
    );
  }
}
