import 'package:flutter/material.dart';

class AppPaddings {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double superLarge = 48.0;
}

class AppBorder {
  static const double medium = 45.0;
  static const double borderTextFieldLogin = 24.0;

  static const double borderTextFieldSignInVertical = 8.0;
  static const double borderTextFieldSignInHorizontal = 24.0;
}

class AppFonts {
  static const double small = 8.0;
  static const double medium = 12.0;
  static const double large = 16.0;
  static const double superLarge = 28;
}

class AppImage {
  static const double medium = 170.0;
}

class GetImage {
  static String loGoImage = 'assets/magic_box_icon.png';
}

class GetString {
  ///Login screen
  static const String appTitle = "บริษัท เมจิกเทคโซลูชั่น จำกัด";
  static const String loginTitle = "ลงชื่เข้าสู่ระบบ";
  static const String userName = "ชื่อผู้ใช้งาน";
  static const String password = "รหัสผ่าน";
  static const String signIn = "เข้าสู่ระบบ";
  static const String signInSuccessfully = "เข้าสู่ระบบสำเร็จ";
  static const String forGotPassword = "ลืมรหัสผ่าน?";

  static const String magicUsername = 'magic_owner';
  static const String magicPassword = '12345678';

  static const String loginUsernameRequired = "กรุณากรอกชื่อผู้ใช้งาน";
  static const String loginPasswordRequired = "กรุณากรอกรหัสผ่าน";
  static const String loginPasswordInvalid = "รหัสผ่านต้องเป็นตัวเลข 8 หลัก.";
  static const String loginInvalidCredentials =
      "ชื่อผู้ใช้งานหรือรหัาผ่านไม่ถูกต้อง";
  static const String loginUnexpectedError =
      "เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง";

  ///Dialog
  static const String alertTitle = "แจ้งเตือน";
  static const String close = "ปิด";
  static const String confirm = "ยืนยัน";
  static const String cancel = "ยกเลิก";
}

/// App Colors Const
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kPrimaryGray = Color(0xFF7F8C8D);
const Color kLightGrayColor = Color(0xFFC3C3C7);
const Color kBgLightGrayColor = Color(0xFFF9F7FD);
const Color kSolidBlack = Color(0xFF000000);
const Color kPrimaryGreen = Color(0xFF069FA3);

const Color kPrimaryBlue = Color(0xFF385CAD);
const Color kBlueIosDialog = Color(0xFF007AFF);
