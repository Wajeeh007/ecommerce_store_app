import 'package:ecommerce_store/utils/api_base_helper.dart';

class LoginRepo {

  Future<dynamic> login() async {
    final apiResponseJson = await ApiBaseHelper().getMethod(url: 'auth/login');
    print(apiResponseJson);
  }

}