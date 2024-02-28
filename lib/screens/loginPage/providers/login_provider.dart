import 'package:demo_app/screens/loginPage/models/login_request.dart';
import 'package:demo_app/screens/loginPage/repo/base_login_repo.dart';
import 'package:flutter/material.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class LoginProvider extends ChangeNotifier {
  final BaseLoginRepo _baseLoginRepo;

  LoginProvider(this._baseLoginRepo);

  login(LoginRequest request) async {
    return _baseLoginRepo.login(request);
  }

  verifyOtp(String otp) async {
    return _baseLoginRepo.verifyOtp(otp);
  }
}
