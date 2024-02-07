import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio_logic_api/features/Post/data/repositories/post_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/post_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    // fetchPosts();
  }

  PostRepository repository = PostRepository();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await repository.fetchPosts();
      emit(PostLoadedState(posts: posts));
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      // ignore: deprecated_member_use, unrelated_type_equality_checks
      if (e.type == DioErrorType) {
        emit(PostErrorState(errorMsg: 'Please check your internet connection'));
      } else {
        emit(PostErrorState(errorMsg: e.type.toString()));
      }
    }
  }
}
