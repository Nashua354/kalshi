import 'dart:convert';

import 'package:kalshi/constants/api_urls.dart';
import 'package:kalshi/constants/global_constants.dart';
import 'package:kalshi/models/balance_model.dart';
import 'package:kalshi/services/api_service.dart';

class BalanceRepository {
  Future<BalanceModel> fetchBalance() async {
    String token = GlobalInstance().token;

    var response = await ApiService()
        .get(APIUrl.fetchBalance, headers: {"Authorization": "Bearer $token"});
    return BalanceModel.fromJson(json.decode(response));
  }
}
