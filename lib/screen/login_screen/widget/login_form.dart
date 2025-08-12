import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_solution_test/bloc/login/authentication/authentication_bloc.dart';
import 'package:magic_solution_test/bloc/login/display_password_cubit/display_password_cubit.dart';
import 'package:magic_solution_test/component/custom_textfield.dart';
import 'package:magic_solution_test/extension/text_styles.dart';
import 'package:magic_solution_test/utils/app_constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:magic_solution_test/utils/nav.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    /// Use for control text in text field
    final userCtrl = useTextEditingController();
    final passCtrl = useTextEditingController();

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppBorder.medium),
            topRight: Radius.circular(AppBorder.medium),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppPaddings.superLarge),
              child: Text(
                GetString.loginTitle,
                style: SetStyle.sarabunSemiBold(
                  AppPaddings.medium,
                ).copyWith(color: kPrimaryGreen),
              ),
            ),

            ///UserName Secession
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppPaddings.small,
                horizontal: AppPaddings.large,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  GetString.userName,
                  style: SetStyle.sarabunSemiBold(AppFonts.large),
                ),
              ),
            ),
            CustomTextField(
              controller: userCtrl,
              hintText: GetString.userName,
              textStyle: SetStyle.sarabunSemiBold(AppFonts.medium),
              hintStyle: SetStyle.sarabunSemiBold(
                AppFonts.medium,
              ).copyWith(color: kLightGrayColor),
            ),

            ///Password Secession
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppPaddings.small,
                horizontal: AppPaddings.large,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  GetString.password,
                  style: SetStyle.sarabunSemiBold(AppFonts.large),
                ),
              ),
            ),
            BlocBuilder<DisplayPasswordCubit, DisplayPasswordState>(
              builder: (context, state) {
                ///Use for display and hide password
                final isDisplayPassword = state is IsDisplayPasswordState
                    ? state.isDisplayPassword
                    : false;

                return CustomTextField(
                  controller: passCtrl,
                  hintText: GetString.password,
                  textStyle: SetStyle.sarabunSemiBold(AppFonts.medium),
                  hintStyle: SetStyle.sarabunSemiBold(
                    AppFonts.medium,
                  ).copyWith(color: kLightGrayColor),
                  obscureText: isDisplayPassword ? false : true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      ///Use for toggle display and hide password event
                      context
                          .read<DisplayPasswordCubit>()
                          .togglePasswordVisibility();
                    },
                    icon: Icon(
                      isDisplayPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: kPrimaryGray,
                    ),
                  ),
                );
              },
            ),

            ///Forgot password
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppPaddings.small,
                horizontal: AppPaddings.large,
              ),
              child: GestureDetector(
                onTap: () {
                  Nav.toForgotPasswordScreen(context);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    GetString.forGotPassword,
                    style: SetStyle.sarabunSemiBold(
                      AppFonts.medium,
                    ).copyWith(color: kPrimaryGreen),
                  ),
                ),
              ),
            ),

            ///Sign In Button
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppPaddings.superLarge),
              child: GestureDetector(
                onTap: () {
                  ///Call login event
                  context.read<AuthenticationBloc>().add(
                    LoginPressedEvent(
                      userCtrl.text.trim(),
                      passCtrl.text.trim(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: AppBorder.borderTextFieldSignInVertical,
                    horizontal: AppBorder.borderTextFieldSignInHorizontal,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppBorder.medium),
                    ),
                  ),
                  child: Text(
                    GetString.signIn,
                    style: SetStyle.sarabunBold(
                      AppFonts.large,
                    ).copyWith(color: kWhiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
