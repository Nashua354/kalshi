part of "balance_bloc.dart";

abstract class BalanceStates {}

class InitialBalanceState extends BalanceStates {}

class LoadingBalanceState extends BalanceStates {}

class LoadedBalanceState extends BalanceStates {
  BalanceModel data;
  LoadedBalanceState(this.data);
}

class FailureBalanceState extends BalanceStates {}
