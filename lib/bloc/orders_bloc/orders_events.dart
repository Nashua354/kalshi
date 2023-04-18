part of "orders_bloc.dart";

abstract class OrdersEvents {}

class CreateLimitOrder extends OrdersEvents {
  int price;
  String ticker;
  String side;
  int contractAmount;
  CreateLimitOrder(this.contractAmount, this.price, this.side, this.ticker);
}
