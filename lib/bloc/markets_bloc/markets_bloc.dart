import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/models/events_model.dart';
import 'package:kalshi/models/markets_model.dart';
import 'package:kalshi/repository/events_repository.dart';
import 'package:kalshi/repository/markets_repository.dart';
part 'markets_events.dart';
part 'markets_states.dart';

class MarketsBloc extends Bloc<MarketsEvents, MarketsState> {
  MarketsBloc(super.initialState) {
    on<FetchMarkets>(_onFetchMarkets);
  }
  Future<void> _onFetchMarkets(
    FetchMarkets event,
    Emitter<MarketsState> emit,
  ) async {
    emit(LoadingMarketState());

    var response = await MarketsRepository().fetchMarkets(event.seriesTicker);

    emit(LoadedMarketState(response));
  }
}
