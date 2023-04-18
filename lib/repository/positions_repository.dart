import 'dart:convert';

import 'package:kalshi/constants/api_urls.dart';
import 'package:kalshi/constants/global_constants.dart';
import 'package:kalshi/models/positions_model.dart';
import 'package:kalshi/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PositionsRepository {
  Future<PositionsModel> fetchPositions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";

    var response = await ApiService().get(APIUrl.fetchPositions,
        headers: {"Authorization": "Bearer $token"});
    return PositionsModel.fromJson(json.decode(response));
  }
}
