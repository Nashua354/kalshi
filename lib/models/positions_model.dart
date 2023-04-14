class PositionsModel {
  PositionsModel({
    required this.marketPositions,
    required this.eventPositions,
  });

  final List<MarketPosition> marketPositions;
  final List<EventPosition> eventPositions;

  factory PositionsModel.fromJson(Map<String, dynamic> json) => PositionsModel(
        marketPositions: List<MarketPosition>.from(
            json["market_positions"].map((x) => MarketPosition.fromJson(x))),
        eventPositions: List<EventPosition>.from(
            json["event_positions"].map((x) => EventPosition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "market_positions":
            List<dynamic>.from(marketPositions.map((x) => x.toJson())),
        "event_positions":
            List<dynamic>.from(eventPositions.map((x) => x.toJson())),
      };
}

class EventPosition {
  EventPosition({
    required this.eventTicker,
    required this.totalCost,
    required this.eventExposure,
    required this.realizedPnl,
    required this.restingOrderCount,
    required this.feesPaid,
  });

  final String eventTicker;
  final int totalCost;
  final int eventExposure;
  final int realizedPnl;
  final int restingOrderCount;
  final int feesPaid;

  factory EventPosition.fromJson(Map<String, dynamic> json) => EventPosition(
        eventTicker: json["event_ticker"],
        totalCost: json["total_cost"],
        eventExposure: json["event_exposure"],
        realizedPnl: json["realized_pnl"],
        restingOrderCount: json["resting_order_count"],
        feesPaid: json["fees_paid"],
      );

  Map<String, dynamic> toJson() => {
        "event_ticker": eventTicker,
        "total_cost": totalCost,
        "event_exposure": eventExposure,
        "realized_pnl": realizedPnl,
        "resting_order_count": restingOrderCount,
        "fees_paid": feesPaid,
      };
}

class MarketPosition {
  MarketPosition({
    required this.ticker,
    required this.totalTraded,
    required this.position,
    required this.marketExposure,
    required this.realizedPnl,
    required this.restingOrdersCount,
    required this.feesPaid,
  });

  final String ticker;
  final int totalTraded;
  final int position;
  final int marketExposure;
  final int realizedPnl;
  final int restingOrdersCount;
  final int feesPaid;

  factory MarketPosition.fromJson(Map<String, dynamic> json) => MarketPosition(
        ticker: json["ticker"],
        totalTraded: json["total_traded"],
        position: json["position"],
        marketExposure: json["market_exposure"],
        realizedPnl: json["realized_pnl"],
        restingOrdersCount: json["resting_orders_count"],
        feesPaid: json["fees_paid"],
      );

  Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "total_traded": totalTraded,
        "position": position,
        "market_exposure": marketExposure,
        "realized_pnl": realizedPnl,
        "resting_orders_count": restingOrdersCount,
        "fees_paid": feesPaid,
      };
}
