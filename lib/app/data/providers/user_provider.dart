import 'dart:convert';

import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://reqres.in/api/';
  }

  Future<List<User>> getUsers() async {
    final response = await get('users');
    List<dynamic> body = response.body['data'];
    List<User> data = [];
    for (var user in body) {
      data.add(
        User.fromJson(user),
      );
    }
    return data;
  }

  Future<User?> getUser(int id) async {
    final response = await get('users/$id');
    return response.body;
  }

  Future<Response<User>> postUser(User user) async => await post('users', user);
  Future<Response> deleteUser(int id) async => await delete('users/$id');
}
