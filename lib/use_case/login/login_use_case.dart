import 'package:magic_solution_test/repository/login/auth_repository.dart';
import 'package:magic_solution_test/utils/app_constants.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  /// return true = login success
  /// return false = login fail
  /// throw Exception = unexpected error

  Future<bool> call(String username, String password) async {
    try {
      final isValid = await repository.login(username, password);
      return isValid;
    } catch (e) {
      throw Exception(e);
    }
  }
}
