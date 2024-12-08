import 'package:flutter_fundamental/core/data/entity/user_model.dart';
import 'package:flutter_fundamental/core/helpers/dio_helper.dart';

class DioUserRepository {
  final dioHelper = DioHelper(baseUrl: 'https://reqres.in/api');

  Future<List<UserModel>> getUsers() async {
    final response = await dioHelper.dio.get('/users');
    final data = response.data;
    List<UserModel> users = [];
    for (var user in data["data"]) {
      users.add(UserModel.fromJson(user));
    }
    return users;
  }
}
