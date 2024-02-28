import 'package:demo_app/base/constants/app_colors.dart';
import 'package:demo_app/base/constants/app_strings.dart';
import 'package:demo_app/base/ui/local_notifications/app_snack_bar.dart';
import 'package:demo_app/base/ui/widgets/loadingButton/providers/loading_button_provider.dart';
import 'package:demo_app/base/ui/widgets/loadingButton/ui/loading_button.dart';
import 'package:demo_app/base/ui/widgets/text_widget.dart';
import 'package:demo_app/core/configurations/service_locator.dart';
import 'package:demo_app/screens/loginPage/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => LoginProvider(sl()),
      child: OtpWidget(phoneNumber: phoneNumber),
    );
  }
}

class OtpWidget extends StatefulWidget {
  const OtpWidget({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  late final TextEditingController _otpController;
  late LoadingButtonProvider _loadingButtonProvider;

  bool _filled = false;

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(otpSent, fontWeight: FontWeight.w500),
              const SizedBox(width: 8),
              TextWidget(widget.phoneNumber, textColor: primaryColor),
            ],
          ),
          const SizedBox(height: 32),
          PinInputTextField(
            controller: _otpController,
            pinLength: 6,
            decoration: BoxLooseDecoration(
              strokeColorBuilder: PinListenColorBuilder(primaryColor, grey500),
              bgColorBuilder: null,
            ),
            textInputAction: TextInputAction.go,
            enabled: true,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.characters,
            onChanged: (pin) => setState(() => _filled = pin.length == 6),
            enableInteractiveSelection: false,
          ),
          const SizedBox(height: 64),
          LoadingButton(
              text: confirm,
              textColor: white,
              bgColor: _filled ? primaryColor : grey400,
              radius: 12,
              initLoading: false,
              usedProvider: (provider) => _loadingButtonProvider = provider,
              onTap: () async {
                if (_filled) {
                  _loadingButtonProvider.setLoading(true);
                  await context.read<LoginProvider>().verifyOtp(_otpController.text);
                  _loadingButtonProvider.setLoading(false);

                  if (mounted) {
                    _onSuccess();
                  }
                }
              }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  _onSuccess() {
    AppSnackBar.show(context: context, message: 'Success', backgroundColor: primaryColor);
    Navigator.pop(context);
  }
}
