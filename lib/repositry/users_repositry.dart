import 'package:api_practice/api/users_api.dart';
import 'package:api_practice/models/UsersModel.dart';

class Repository {
  final apiService = UserApiService();
  Future<List<UsersModel>> fetchData() async {
    return await apiService.fetchData();
  }
}
