import 'package:demo_app/base/constants/app_colors.dart';
import 'package:demo_app/base/constants/app_icons.dart';
import 'package:demo_app/base/constants/app_strings.dart';
import 'package:demo_app/base/ui/app_bottom_sheet.dart';
import 'package:demo_app/base/ui/local_notifications/app_snack_bar.dart';
import 'package:demo_app/base/ui/widgets/loadingButton/providers/loading_button_provider.dart';
import 'package:demo_app/base/ui/widgets/loadingButton/ui/loading_button.dart';
import 'package:demo_app/base/ui/widgets/text_form_field_widget.dart';
import 'package:demo_app/base/ui/widgets/text_widget.dart';
import 'package:demo_app/core/configurations/service_locator.dart';
import 'package:demo_app/core/network/models/api_response_handler.dart';
import 'package:demo_app/core/network/models/request_status.dart';
import 'package:demo_app/screens/loginPage/models/login_request.dart';
import 'package:demo_app/screens/loginPage/providers/login_provider.dart';
import 'package:demo_app/screens/loginPage/ui/widgets/otp_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => LoginProvider(sl()),
      child: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _phoneNumberController;

  late LoadingButtonProvider _loadingButtonProvider;

  bool _accept = false;

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(signIn),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Icon(Icons.phone_android, size: 64, color: grey500),
              const SizedBox(height: 12),
              TextWidget(enterMobileNumber),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: TextFormFieldWidget(
                  controller: _phoneNumberController,
                  margin: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.phone_android, color: grey400),
                  label: phoneNumber,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  isDense: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return mobileNumberIsRequired;
                    } else if (value.length != 10) {
                      return enterValidMobileNumber;
                    }
                    return null;
                  },
                ),
              ),

              LoadingButton(
                height: kToolbarHeight,
                text: continueT,
                textColor: white,
                radius: 12,
                margin: const EdgeInsets.symmetric(vertical: 40),
                initLoading: false,
                usedProvider: (provider) => _loadingButtonProvider = provider,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _loadingButtonProvider.setLoading(true);

                    LoginRequest request = LoginRequest(mobile: _phoneNumberController.text);
                    ApiResponseHandler response = await context.read<LoginProvider>().login(request);
                    _loadingButtonProvider.setLoading(false);
                    if (mounted) {
                      if (response.status == RequestStatus.loaded) {
                        _onSuccess();
                      } else {}
                    }
                  }
                },
              ),

              ///social media
              Row(
                children: [
                  Expanded(child: Divider(color: grey300)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextWidget(orSignInWith, textColor: grey700),
                  ),
                  Expanded(child: Divider(color: grey300)),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: (kToolbarHeight - 10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: grey300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(icGoogle),
                          const SizedBox(width: 8),
                          TextWidget(google, fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: (kToolbarHeight - 10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: grey300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(icFacebook),
                          const SizedBox(width: 8),
                          TextWidget(facebook, fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              ///privacy policy
              const SizedBox(height: 64),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _accept,
                    onChanged: (value) => setState(() => _accept = !_accept),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: grey600, height: 1.5),
                        children: [
                          TextSpan(text: '$agreePrivacyPolicy '),
                          TextSpan(
                            text: '$agreement ',
                            style: const TextStyle(color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ///TODO
                              },
                          ),
                          TextSpan(text: '$and '),
                          TextSpan(
                            text: privacyPolicy,
                            style: const TextStyle(color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ///TODO:
                              },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onSuccess() {
    AppBottomSheet.show(context, OtpScreen(phoneNumber: _phoneNumberController.text), onCancelled: () {
      AppSnackBar.show(context: context, message: 'Canceled', backgroundColor: red);
    });
  }
}
