part of "positions_bloc.dart";

abstract class PositionStates {}

class InitialPositionState extends PositionStates {}

class LoadingPositionState extends PositionStates {}

class LoadedPositionState extends PositionStates {
  PositionsModel positionsData;
  LoadedPositionState(this.positionsData);
}

class FailurePositionState extends PositionStates {}
