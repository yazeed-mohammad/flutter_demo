/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class LoginRequest {
  String mobile;

  LoginRequest({required this.mobile});

  Map<String, String> toJson() => {
        "mobile": mobile,
      };
}
