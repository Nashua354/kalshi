part of 'markets_bloc.dart';

abstract class MarketsState {}

class InitialMarketsState extends MarketsState {}

class LoadingMarketState extends MarketsState {}

class LoadedMarketState extends MarketsState {
  MarketsModel markets;
  LoadedMarketState(this.markets);
}

class FailureMarketState extends MarketsState {}
