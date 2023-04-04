class EventsModel {
  EventsModel({
    required this.events,
    required this.cursor,
  });

  final List<Event> events;
  final String cursor;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        cursor: json["cursor"],
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "cursor": cursor,
      };
}

class Event {
  Event({
    required this.eventTicker,
    required this.seriesTicker,
    required this.subTitle,
    required this.title,
    required this.mutuallyExclusive,
    required this.category,
    required this.strikeDate,
    required this.strikePeriod,
  });

  final String eventTicker;
  final String seriesTicker;
  final String subTitle;
  final String title;
  final bool mutuallyExclusive;
  final String category;
  final DateTime strikeDate;
  final String strikePeriod;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        eventTicker: json["event_ticker"],
        seriesTicker: json["series_ticker"],
        subTitle: json["sub_title"],
        title: json["title"],
        mutuallyExclusive: json["mutually_exclusive"],
        category: json["category"],
        strikeDate: DateTime.parse(json["strike_date"]),
        strikePeriod: json["strike_period"],
      );

  Map<String, dynamic> toJson() => {
        "event_ticker": eventTicker,
        "series_ticker": seriesTicker,
        "sub_title": subTitle,
        "title": title,
        "mutually_exclusive": mutuallyExclusive,
        "category": category,
        "strike_date": strikeDate.toIso8601String(),
        "strike_period": strikePeriod,
      };
}

// enum Category {
//   SCIENCE_TECHNOLOGY,
//   ECONOMICS,
//   POLITICS,
//   CLIMATE_AND_WEATHER,
//   COVID_19,
//   WORLD,
//   FINANCIALS,
//   TRANSPORTATION,
//   ENTERTAINMENT
// }

// final categoryValues = EnumValues({
//   "Climate and Weather": Category.CLIMATE_AND_WEATHER,
//   "COVID-19": Category.COVID_19,
//   "Economics": Category.ECONOMICS,
//   "Entertainment": Category.ENTERTAINMENT,
//   "Financials": Category.FINANCIALS,
//   "Politics": Category.POLITICS,
//   "Science & Technology": Category.SCIENCE_TECHNOLOGY,
//   "Transportation": Category.TRANSPORTATION,
//   "World": Category.WORLD
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
