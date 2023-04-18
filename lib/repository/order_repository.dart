import 'dart:convert';

import 'package:kalshi/constants/api_urls.dart';
import 'package:kalshi/models/create_order_model.dart';
import 'package:kalshi/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class OrderRepository {
  Future<CreateOrderModel> limitOrder(int price, String ticker, String side,
      String action, int contractAmount) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    var uuid = Uuid();
    Map body = {
      "action": action,
      "client_order_id": uuid.v4(),
      "count": contractAmount,
      "side": side,
      "ticker": ticker,
      "type": "limit"
    };
    (side == "yes")
        ? body.addAll({"yes_price": price})
        : body.addAll({"no_price": price});

    var response = await ApiService().post(APIUrl.createOrder,
        headers: {"Authorization": "Bearer $token"}, body: body);
    return CreateOrderModel.fromJson(json.decode(response));
  }
}
