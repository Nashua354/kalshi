import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/models/balance_model.dart';
import 'package:kalshi/repository/balance_repository.dart';
part 'balance_states.dart';
part 'balance_events.dart';

class BalanceBloc extends Bloc<BalanceEvents, BalanceStates> {
  BalanceBloc(super.initialState) {
    on<FetchBalanceEvent>(fetchBalanceAsync);
  }
  Future<void> fetchBalanceAsync(
      FetchBalanceEvent event, Emitter<BalanceStates> emit) async {
    emit(LoadingBalanceState());

    var response = await BalanceRepository().fetchBalance();
    emit(LoadedBalanceState(response));
  }
}
