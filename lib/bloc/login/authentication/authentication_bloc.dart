import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:magic_solution_test/use_case/login/login_use_case.dart';
import 'package:magic_solution_test/utils/app_constants.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUseCase loginUseCase;
  AuthenticationBloc({required this.loginUseCase})
    : super(AuthenticationInitial()) {
    on<LoginPressedEvent>(_onLoginPressed);
  }

  Future<void> _onLoginPressed(
    LoginPressedEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationInitial());

    /// Validate Input
    final error = _validateInputs(event.username, event.password);

    if (error != null) {
      emit(AuthenticationError(message: error));
      return;
    }

    /// Loading State
    emit(AuthenticationLoading());
    try {
      /// Call UseCase
      final result = await loginUseCase(event.username, event.password);

      /// Handle Result
      if (!result) {
        emit(AuthenticationError(message: GetString.loginInvalidCredentials));
        return;
      }
      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationError(message: GetString.loginUnexpectedError));
    }
  }

  String? _validateInputs(String username, String password) {
    if (username.isEmpty) return GetString.loginUsernameRequired;
    if (password.isEmpty) return GetString.loginPasswordRequired;
    if (password.length != 8 || int.tryParse(password) == null) {
      return GetString.loginPasswordInvalid;
    }
    return null;
  }
}
