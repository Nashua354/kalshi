part of 'auth_bloc.dart';

abstract class AuthEvents {}

class LoginRequested extends AuthEvents {
  String email;
  String password;
  LoginRequested(this.email, this.password);
}

class IsUserLoggedIn extends AuthEvents {}
