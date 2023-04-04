import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/auth_bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextField(),
          TextField(),
          TextButton(
            onPressed: () {
              context
                  .read<AuthBloc>()
                  .add(LoginRequested("nitishssahani@gmail.com", "Soumik@95"));
            },
            child: Text('Login'),
          ),
        ],
      )),
    );
  }
}
