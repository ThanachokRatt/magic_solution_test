import 'package:magic_solution_test/utils/app_constants.dart';

abstract class AuthRepository {
  Future<bool> login(String username, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<bool> login(String username, String password) async {
    /// mock API delay
    await Future.delayed(const Duration(seconds: 2));

    return username == GetString.magicUsername &&
        password == GetString.magicPassword;
  }
}
