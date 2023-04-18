import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/auth_bloc/auth_bloc.dart';
import 'package:kalshi/screens/home_screen.dart';
import 'package:kalshi/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(IsUserLoggedIn());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: context.read<AuthBloc>(),
        child: Scaffold(
          body: Center(child: Image.asset("assets/logo/logo192.png")),
        ),
        listenWhen: (previous, current) => current is AuthStatusState,
        listener: (context, state) {
          if (state is NewUserLogInState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => BlocProvider(
                    create: (context) => AuthBloc(AuthInitialState()),
                    child: const LoginScreen())));
          } else if (state is UserAlreadyLoggedInState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomeScreen()));
          }
        });
  }
}
