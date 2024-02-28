import 'package:demo_app/core/network/models/api_response_handler.dart';
import 'package:demo_app/screens/loginPage/models/login_request.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

abstract class BaseLoginData {
  Future<ApiResponseHandler> login(LoginRequest request);

  Future<ApiResponseHandler> verifyOtp(String request);
}
