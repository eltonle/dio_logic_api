import 'package:dio/dio.dart';
import 'package:dio_logic_api/features/Post/data/models/post_model.dart';
import 'package:dio_logic_api/features/Post/data/repositories/api/api.dart';

class PostRepository {
  API api = API();
  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get('/posts');
      List<dynamic> postsMaps = response.data;
      var posts =
          postsMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
