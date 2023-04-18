import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/repository/order_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'orders_events.dart';
part 'orders_states.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  OrdersBloc(super.initialState) {
    on<CreateLimitOrder>(_createLimitOrder);
  }
  Future<void> _createLimitOrder(
      CreateLimitOrder event, Emitter<OrdersStates> emit) async {
    emit(LoadingCreateOrderState());

    var response = OrderRepository().limitOrder(
        event.price, event.ticker, event.side, "buy", event.contractAmount);
    emit(LoadedCreateOrderState());
  }
}
