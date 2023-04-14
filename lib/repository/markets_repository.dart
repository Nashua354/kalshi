import 'dart:convert';

import 'package:kalshi/constants/api_urls.dart';
import 'package:kalshi/constants/global_constants.dart';
import 'package:kalshi/models/markets_model.dart';
import 'package:kalshi/services/api_service.dart';

class MarketsRepository {
  Future<MarketsModel> fetchMarkets(String seriesTicker) async {
    String token = GlobalInstance().token;
    var response = await ApiService().get(APIUrl.fetchMarkets(seriesTicker),
        headers: {"Authorization": "Bearer $token"});
    return MarketsModel.fromJson(json.decode(response));
  }
}
