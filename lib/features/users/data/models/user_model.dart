// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataUser {
  List<UserModel> data;
  DataUser({
    required this.data,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
        data: List.from(json['data'].map((user) => UserModel.fromJson(user))));
  }
}

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
