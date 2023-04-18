import 'dart:convert';

import 'package:kalshi/constants/api_urls.dart';
import 'package:kalshi/models/balance_model.dart';
import 'package:kalshi/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalanceRepository {
  Future<BalanceModel> fetchBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";

    var response = await ApiService()
        .get(APIUrl.fetchBalance, headers: {"Authorization": "Bearer $token"});
    return BalanceModel.fromJson(json.decode(response));
  }
}
