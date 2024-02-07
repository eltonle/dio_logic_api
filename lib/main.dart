import 'package:dio_logic_api/features/Post/logic/cubit/post_cubit.dart';
import 'package:dio_logic_api/features/users/data/repositories/user_repository.dart';
import 'package:dio_logic_api/features/users/logic/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostCubit()..fetchPosts(),
        ),
        BlocProvider(
          create: (context) => UserBloc(
            userRepository: UserRepository(),
          )..add(UserFetchEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
