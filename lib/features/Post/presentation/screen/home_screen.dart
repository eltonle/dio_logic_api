import 'package:dio_logic_api/features/Post/logic/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Api Handing',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<PostCubit, PostState>(
        listener: (BuildContext context, PostState state) {
          if (state is PostErrorState) {
            SnackBar snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMsg),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is PostLoadedState) {
            var posts = state.posts;
            return buildPostWidget(posts);
          } else if (state is PostErrorState) {
            return Center(
              child: Text(state.errorMsg.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget buildPostWidget(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(posts[index].title.split(' ')[0][0].toUpperCase()),
          ),
          title: Text(posts[index].title.toString()),
          subtitle: Text(posts[index].body.toString()),
        );
      },
    );
  }
}
