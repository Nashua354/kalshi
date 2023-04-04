import 'package:kalshi/constants/api_urls.dart';
import 'package:kalshi/models/login_model.dart';
import 'package:kalshi/services/api_service.dart';

class LoginRepository {
  Future<LoginModel> login(String email, String password) async {
    var response = await ApiService()
        .post(APIUrl.login, body: {"email": email, "password": password});
    return LoginModel.fromJson(response);
  }
}
