class CreateOrderModel {
  CreateOrderModel({
    required this.order,
  });

  final Order order;

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) =>
      CreateOrderModel(
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order.toJson(),
      };
}

class Order {
  Order({
    required this.action,
    required this.clientOrderId,
    required this.createdTime,
    required this.expirationTime,
    required this.noPrice,
    required this.orderId,
    required this.side,
    required this.status,
    required this.ticker,
    required this.type,
    required this.userId,
    required this.yesPrice,
  });

  final String action;
  final String clientOrderId;
  final DateTime? createdTime;
  final DateTime? expirationTime;
  final int noPrice;
  final String orderId;
  final String side;
  final String status;
  final String ticker;
  final String type;
  final String userId;
  final int yesPrice;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        action: json["action"],
        clientOrderId: json["client_order_id"],
        createdTime: (json["created_time"] != null)
            ? DateTime.parse(json["created_time"])
            : null,
        expirationTime: json["expiration_time"] != null
            ? DateTime.parse(json["expiration_time"])
            : null,
        noPrice: json["no_price"],
        orderId: json["order_id"],
        side: json["side"],
        status: json["status"],
        ticker: json["ticker"],
        type: json["type"],
        userId: json["user_id"],
        yesPrice: json["yes_price"],
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "client_order_id": clientOrderId,
        "created_time": createdTime?.toIso8601String(),
        "expiration_time": expirationTime?.toIso8601String(),
        "no_price": noPrice,
        "order_id": orderId,
        "side": side,
        "status": status,
        "ticker": ticker,
        "type": type,
        "user_id": userId,
        "yes_price": yesPrice,
      };
}
