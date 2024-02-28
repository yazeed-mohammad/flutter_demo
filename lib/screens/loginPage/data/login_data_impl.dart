import 'package:demo_app/core/network/constants/end_points.dart';
import 'package:demo_app/core/network/http/http_client.dart';
import 'package:demo_app/core/network/models/api_response_handler.dart';
import 'package:demo_app/screens/loginPage/data/base_login_data.dart';
import 'package:demo_app/screens/loginPage/models/login_request.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class LoginDataImpl implements BaseLoginData {
  final HttpClient _httpClient;

  LoginDataImpl(this._httpClient);

  @override
  Future<ApiResponseHandler> login(LoginRequest request) async {
    return await _httpClient.post(endPoint: EndPoints.login, payload: request.toJson());
  }

  @override
  Future<ApiResponseHandler> verifyOtp(String otp) async {
    return await _httpClient.post(endPoint: EndPoints.verifyOtp, payload: {"otp": otp});
  }
}
