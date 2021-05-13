import 'package:get/get.dart';

class UserRepository extends GetConnect {
  Future<Response> fetchUser() async {
    return get('https://reqres.in/api/user');
  }
}
