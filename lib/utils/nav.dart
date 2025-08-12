import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_solution_test/routes/routes.dart';

class Nav {
  static Future<void> toForgotPasswordScreen(BuildContext context) {
    return context.pushNamed(Routes.forgotPasswordScreen);
  }
}
