import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/models/positions_model.dart';
import 'package:kalshi/repository/positions_repository.dart';
part "positions_events.dart";
part "positions_states.dart";

class PositionBloc extends Bloc<PositionEvents, PositionStates> {
  PositionBloc(super.initialState) {
    on<FetchPositionEvent>(_fetchPositionEvents);
  }
  Future<void> _fetchPositionEvents(
      PositionEvents event, Emitter<PositionStates> emit) async {
    emit(LoadingPositionState());

    var response = await PositionsRepository().fetchPositions();
    emit(LoadedPositionState(response));
  }
}
