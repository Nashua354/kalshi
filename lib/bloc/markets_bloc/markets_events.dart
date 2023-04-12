part of 'markets_bloc.dart';

abstract class MarketsEvents {}

class FetchMarkets extends MarketsEvents {
  String seriesTicker;
  FetchMarkets(this.seriesTicker);
}
