part of 'markets_bloc.dart';

abstract class MarketsState {}

class InitialMarketsState extends MarketsState {}

class LoadingMarketState extends MarketsState {}

class LoadedMarketState extends MarketsState {
  MarketsModel marketsData;
  LoadedMarketState(this.marketsData);
}

class FailureMarketState extends MarketsState {}
