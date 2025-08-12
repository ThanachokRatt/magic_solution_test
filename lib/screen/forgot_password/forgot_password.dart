import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:magic_solution_test/component/custom_textfield.dart';
import 'package:magic_solution_test/extension/text_styles.dart';
import 'package:magic_solution_test/share_wifget/company_info.dart';
import 'package:magic_solution_test/utils/app_constants.dart';

class ForgotPasswordScreen extends HookWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = useTextEditingController();
    return Scaffold(
      backgroundColor: kPrimaryGreen,
      appBar: AppBar(
        title: Text(
          GetString.forGotPassword,
          style: SetStyle.sarabunBold(AppFonts.large),
        ),
      ),
      body: Column(
        children: [
          ShareCompanyInfoWidget.buildMagicSolutionLogo(),
          ShareCompanyInfoWidget.buildCompanyName(),
          _buildForgotPasswordForm(userCtrl),
        ],
      ),
    );
  }

  Expanded _buildForgotPasswordForm(TextEditingController userCtrl) {
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
          children: [
            /// Title
            Padding(
              padding: EdgeInsets.only(top: AppPaddings.superLarge),
              child: Text(
                GetString.forGotPassword,
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

            ///Forgot password Ui
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppPaddings.superLarge),
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
                  GetString.confirm,
                  style: SetStyle.sarabunBold(
                    AppFonts.large,
                  ).copyWith(color: kWhiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
