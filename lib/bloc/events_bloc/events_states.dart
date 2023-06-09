part of 'events_bloc.dart';

abstract class EventsState {}

class InitialEventState extends EventsState {}

class LoadingEventState extends EventsState {}

class LoadedEventState extends EventsState {
  EventsModel eventsData;
  LoadedEventState(this.eventsData);
}

class FailureEventState extends EventsState {}
