import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/models/events_model.dart';
import 'package:kalshi/repository/events_repository.dart';
part 'events_events.dart';
part 'events_states.dart';

class EventsBloc extends Bloc<EventsDataEvents, EventsState> {
  EventsBloc(super.initialState) {
    on<FetchEvents>(_onFetchEvents);
  }
  Future<void> _onFetchEvents(
    FetchEvents event,
    Emitter<EventsState> emit,
  ) async {
    emit(LoadingEventState());

    var response = await EventsRepository().fetchAllEvents();
    print(response);
    emit(LoadedEventState(response));
  }
}
