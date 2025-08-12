import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_solution_test/bloc/login/authentication/authentication_bloc.dart';
import 'package:magic_solution_test/bloc/login/display_password_cubit/display_password_cubit.dart';
import 'package:magic_solution_test/component/custom_circular_indecator.dart';
import 'package:magic_solution_test/component/custom_dialog.dart';
import 'package:magic_solution_test/component/custom_textfield.dart';
import 'package:magic_solution_test/extension/text_styles.dart';
import 'package:magic_solution_test/repository/login/auth_repository.dart';
import 'package:magic_solution_test/screen/login_screen/widget/login_form.dart';
import 'package:magic_solution_test/share_wifget/company_info.dart';
import 'package:magic_solution_test/use_case/login/login_use_case.dart';
import 'package:magic_solution_test/utils/app_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DisplayPasswordCubit()),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            loginUseCase: LoginUseCase(AuthRepositoryImpl()),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: kPrimaryGreen,
        body: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  ShareCompanyInfoWidget.buildMagicSolutionLogo(),
                  ShareCompanyInfoWidget.buildCompanyName(),
                  LoginForm(),
                ],
              ),
            ),
            _buildLoginBlocConsumer(),
          ],
        ),
      ),
    );
  }

  BlocConsumer<AuthenticationBloc, AuthenticationState> _buildLoginBlocConsumer() {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  CustomDialog.showDialogInfo(
                    context: context,
                    alertDescription: state.message,
                  );
                });
              } else if (state is AuthenticationSuccess) {
                CustomDialog.showDialogInfo(
                  context: context,
                  alertDescription: GetString.signInSuccessfully,
                );
              }
            },
            builder: (context, state) {
              return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  final isLoading = state is AuthenticationLoading;
                  if (isLoading) {
                    return CustomCircularIndecator();
                  }
                  return SizedBox.shrink();
                },
              );
            },
          );
  }
}
