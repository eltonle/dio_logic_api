import 'package:dio/dio.dart';
import 'package:dio_logic_api/features/users/data/models/user_model.dart';

class UserRepository {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  Future<DataUser> getUsers() async {
    final response = await dio.get('/users');
    var users = DataUser.fromJson(response.data);
    return users;
  }
}
