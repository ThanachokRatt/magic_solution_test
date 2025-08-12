import 'package:go_router/go_router.dart';
import 'package:magic_solution_test/screen/forgot_password/forgot_password.dart';
import 'package:magic_solution_test/screen/login_screen/login_screen.dart';

class Routes {
  static const loginScreen = 'login_screen';
  static const forgotPasswordScreen = 'forgot_password_screen';
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/login_screen',
  routes: [
    GoRoute(
      path: '/login_screen',
      name: Routes.loginScreen,
      builder: (_, _) => const LoginScreen(),
    ),

    GoRoute(
      path: '/forgot_password_screen',
      name: Routes.forgotPasswordScreen,
      builder: (_, _) {
        return ForgotPasswordScreen();
      },
    ),
  ],
);
