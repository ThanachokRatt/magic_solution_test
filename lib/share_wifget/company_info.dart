import 'package:flutter/material.dart';
import 'package:magic_solution_test/extension/text_styles.dart';
import 'package:magic_solution_test/utils/app_constants.dart';

class ShareCompanyInfoWidget {
  static Padding buildCompanyName() {
    return Padding(
      padding: EdgeInsets.only(
        top: AppPaddings.medium,
        bottom: AppPaddings.large,
      ),
      child: Text(
        GetString.appTitle,
        style: SetStyle.sarabunBold(
          AppFonts.large,
        ).copyWith(color: kWhiteColor),
      ),
    );
  }

  static Padding buildMagicSolutionLogo() {
    return Padding(
      padding: EdgeInsets.only(top: AppPaddings.superLarge),
      child: ClipOval(
        child: Image.asset(
          GetImage.loGoImage,
          width: AppImage.medium,
          height: AppImage.medium,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
