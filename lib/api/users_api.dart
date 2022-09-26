import 'dart:convert';

import 'package:api_practice/models/UsersModel.dart';
import 'package:http/http.dart';

class UserApiService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
  final String _apiUrl = '/users';
  late Future<List<UsersModel>> list;
  Future<List<UsersModel>> fetchData() async {
    var response = await get(Uri.parse(_baseUrl + _apiUrl));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => UsersModel.fromJson(e)).toList();
    }
    return [];
  }
}
