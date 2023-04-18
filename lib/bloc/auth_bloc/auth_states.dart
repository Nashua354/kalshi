part of 'auth_bloc.dart';

abstract class AuthStates {}

abstract class AuthAPIState extends AuthStates {}

abstract class AuthStatusState extends AuthStates {}

class AuthInitialState extends AuthAPIState {}

class LoginLoadingState extends AuthAPIState {}

class LoginSuccessState extends AuthAPIState {}

class LoginFailureState extends AuthAPIState {}

class NewUserLogInState extends AuthStatusState {}

class UserAlreadyLoggedInState extends AuthStatusState {}
