part of 'events_bloc.dart';

abstract class EventsState {}

class InitialState extends EventsState {}

class LoadingEventState extends EventsState {}

class LoadedEventState extends EventsState {
  EventsModel events;
  LoadedEventState(this.events);
}

class FailureEventState extends EventsState {}
