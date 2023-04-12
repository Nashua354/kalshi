import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/auth_bloc/auth_bloc.dart';
import 'package:kalshi/bloc/events_bloc/events_bloc.dart';
import 'package:kalshi/screens/explore_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener(
          bloc: context.read<AuthBloc>(),
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => BlocProvider(
                      create: (context) => EventsBloc(InitialState()),
                      child: const ExploreScreen())));
            }
          },
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(),
              TextField(),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                      LoginRequested("nitishssahani@gmail.com", "Soumik@95"));
                },
                child: Text('Login'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
