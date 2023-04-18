part of "orders_bloc.dart";

abstract class OrdersStates {}

class InitialOrderState extends OrdersStates {}

class CreateOrderStates extends OrdersStates {}

class LoadingCreateOrderState extends CreateOrderStates {}

class LoadedCreateOrderState extends CreateOrderStates {}

class FailureCreateOrderState extends CreateOrderStates {}
