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
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          hintColor: Colors.redAccent,
          //  accentColor: Colors.redAccent,
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 22.0, color: Colors.redAccent),
            headlineMedium: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: Colors.redAccent,
            ),
            bodyLarge: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent,
            ),
          ),
        ),
        //  ThemeData(
        //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //     useMaterial3: true,
        //   ),
        home: const Home(),
      ),
    );
  }
}
