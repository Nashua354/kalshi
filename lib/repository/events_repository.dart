import 'dart:convert';

import 'package:kalshi/constants/api_urls.dart';
import 'package:kalshi/models/events_model.dart';
import 'package:kalshi/services/api_service.dart';

class EventsRepository {
  Future<EventsModel> fetchAllEvents() async {
    var response = await ApiService().get(APIUrl.fetchEvents);
    return EventsModel.fromJson(json.decode(response));
  }
}
