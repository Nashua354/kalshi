class MarketsModel {
  MarketsModel({
    required this.markets,
    required this.cursor,
  });

  final List<Market> markets;
  final String cursor;

  factory MarketsModel.fromJson(Map<String, dynamic> json) => MarketsModel(
        markets:
            List<Market>.from(json["markets"].map((x) => Market.fromJson(x))),
        cursor: json["cursor"],
      );

  Map<String, dynamic> toJson() => {
        "markets": List<dynamic>.from(markets.map((x) => x.toJson())),
        "cursor": cursor,
      };
}

class Market {
  Market({
    required this.ticker,
    required this.eventTicker,
    required this.title,
    required this.subtitle,
    required this.openTime,
    required this.closeTime,
    required this.expirationTime,
    required this.status,
    required this.yesBid,
    required this.yesAsk,
    required this.noBid,
    required this.noAsk,
    required this.lastPrice,
    required this.previousYesBid,
    required this.previousYesAsk,
    required this.previousPrice,
    required this.volume,
    required this.volume24H,
    required this.liquidity,
    required this.openInterest,
    required this.result,
    required this.canCloseEarly,
    required this.expirationValue,
    required this.category,
    required this.riskLimitCents,
  });

  final String ticker;
  final String eventTicker;
  final String title;
  final String subtitle;
  final DateTime openTime;
  final DateTime closeTime;
  final DateTime expirationTime;
  final String status;
  final int yesBid;
  final int yesAsk;
  final int noBid;
  final int noAsk;
  final int lastPrice;
  final int previousYesBid;
  final int previousYesAsk;
  final int previousPrice;
  final int volume;
  final int volume24H;
  final int liquidity;
  final int openInterest;
  final String result;
  final bool canCloseEarly;
  final String expirationValue;
  final String category;
  final int riskLimitCents;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        ticker: json["ticker"],
        eventTicker: json["event_ticker"],
        title: json["title"],
        subtitle: json["subtitle"],
        openTime: DateTime.parse(json["open_time"]),
        closeTime: DateTime.parse(json["close_time"]),
        expirationTime: DateTime.parse(json["expiration_time"]),
        status: json["status"],
        yesBid: json["yes_bid"],
        yesAsk: json["yes_ask"],
        noBid: json["no_bid"],
        noAsk: json["no_ask"],
        lastPrice: json["last_price"],
        previousYesBid: json["previous_yes_bid"],
        previousYesAsk: json["previous_yes_ask"],
        previousPrice: json["previous_price"],
        volume: json["volume"],
        volume24H: json["volume_24h"],
        liquidity: json["liquidity"],
        openInterest: json["open_interest"],
        result: json["result"],
        canCloseEarly: json["can_close_early"],
        expirationValue: json["expiration_value"],
        category: json["category"],
        riskLimitCents: json["risk_limit_cents"],
      );

  Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "event_ticker": eventTicker,
        "title": title,
        "subtitle": subtitle,
        "open_time": openTime.toIso8601String(),
        "close_time": closeTime.toIso8601String(),
        "expiration_time": expirationTime.toIso8601String(),
        "status": status,
        "yes_bid": yesBid,
        "yes_ask": yesAsk,
        "no_bid": noBid,
        "no_ask": noAsk,
        "last_price": lastPrice,
        "previous_yes_bid": previousYesBid,
        "previous_yes_ask": previousYesAsk,
        "previous_price": previousPrice,
        "volume": volume,
        "volume_24h": volume24H,
        "liquidity": liquidity,
        "open_interest": openInterest,
        "result": result,
        "can_close_early": canCloseEarly,
        "expiration_value": expirationValue,
        "category": category,
        "risk_limit_cents": riskLimitCents,
      };
}
