import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposts_clean_architecture/core/databases/cache/cache_helper.dart';

import 'core/config/routes/routes.dart';
import 'features/post/presentation/screens/cubit/posts_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit()..eitherFailureOrUser(),
      child: MaterialApp(
        initialRoute: Routes.initialRoute,
        routes: Routes.routes,
      ),
    );
  }
}
