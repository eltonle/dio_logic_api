part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostLoadingState extends PostState {}

final class PostLoadedState extends PostState {
  final List<PostModel> posts;

  PostLoadedState({required this.posts});
}

final class PostErrorState extends PostState {
  final String errorMsg;

  PostErrorState({required this.errorMsg});
}
