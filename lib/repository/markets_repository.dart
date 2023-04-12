import 'dart:convert';

import 'package:kalshi/constants/api_urls.dart';
import 'package:kalshi/models/markets_model.dart';
import 'package:kalshi/services/api_service.dart';

class MarketsRepository {
  Future<MarketsModel> fetchMarkets(String seriesTicker) async {
    var response =
        await ApiService().get(APIUrl.fetchMarkets(seriesTicker), headers: {
      "Authorization":
          "6873601d-0ad8-4f82-adc8-6a0cece85dc8:uEMbsoVZgCQw3ulbd5yX4RHZtO8WWgWqn5eK3x7PlO61etkFaeI088FIkc3MnMVQ"
    });
    print(response);
    return MarketsModel.fromJson(json.decode(response));
  }
}
