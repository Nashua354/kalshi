import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/repository/login_repository.dart';
part 'auth_events.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc(super.initialState) {
    on<LoginRequested>(_onLoginRequested);
  }
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthStates> emit,
  ) async {
    emit(LoginLoadingState());

    var response = await LoginRepository().login(event.email, event.password);
    print(response);
    emit(LoginSuccessState());
  }
}