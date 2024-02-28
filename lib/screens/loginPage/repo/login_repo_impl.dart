import 'package:demo_app/core/network/models/api_response_handler.dart';
import 'package:demo_app/core/network/models/request_status.dart';
import 'package:demo_app/screens/loginPage/data/base_login_data.dart';
import 'package:demo_app/screens/loginPage/models/login_request.dart';
import 'package:demo_app/screens/loginPage/repo/base_login_repo.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class LoginRepoImpl implements BaseLoginRepo {
  final BaseLoginData _baseLoginData;

  LoginRepoImpl(this._baseLoginData);

  @override
  Future<ApiResponseHandler> login(LoginRequest request) async {
    ApiResponseHandler response = await _baseLoginData.login(request);

    if (response.statusCode == 200) {
      response = response.copyWith(status: RequestStatus.loaded);
    } else {
      response = response.copyWith(status: RequestStatus.exception);
    }

    return response;
  }

  @override
  Future<ApiResponseHandler> verifyOtp(String otp) async {
    ApiResponseHandler response = await _baseLoginData.verifyOtp(otp);

    if (response.statusCode == 200) {
      response = response.copyWith(status: RequestStatus.loaded);
    } else {
      response = response.copyWith(status: RequestStatus.exception);
    }

    return response;
  }
}
