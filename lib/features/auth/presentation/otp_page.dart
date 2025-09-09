import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:identix_connect/core/theme/app_colors.dart';
import 'package:identix_connect/widgets/buttons/button.dart';
import 'package:identix_connect/widgets/inputs/input_otp_field.dart';
import 'package:identix_connect/widgets/layouts/app_header.dart';
import 'package:identix_connect/widgets/timers/countdown_timer.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();
  final CountdownController _countdownController = CountdownController();
  bool _canResend = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_otpFocusNode);
    });
  }

  void _submitOtp(value) {
    if (_formKey.currentState?.validate() ?? false) {

      final otp = _otpController.text;
      debugPrint("OTP Submitted: $otp dan $value");
      // Lanjutkan ke API / verifikasi
      context.go('/choose-account');
    }
  }

  void _resendCode() {
    debugPrint("resend code");
    setState(() {
      _canResend = false;
    });
    _otpController.clear();

    FocusScope.of(context).requestFocus(_otpFocusNode);
    _countdownController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: "Verification"),
      // appBar: AppHeader(
      //   title: "Profile",
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.settings),
      //       color: AppColors.white,
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const Text.rich(
                TextSpan(
                  text: "Masukan kode OTP yang sudah dikirimkan ke ",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "johnwick@mail.com",
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.dark)
                    )
                  ]
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OtpInputField(
                disabled: _canResend,
                focusNode: _otpFocusNode,
                controller: _otpController,
                length: 6, // bisa diganti misal 4 atau 8
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Please enter 6 digit OTP";
                  }
                  return null;
                },
                onSubmit: _submitOtp,
              ),
              const SizedBox(height: 24),

              CountdownTimer(
                seconds: 10, // 2 menit
                controller: _countdownController,
                onFinished: () {
                  setState(() {
                    _canResend = true;
                  });
                  _otpController.clear();
                },
              ),
              const SizedBox(height: 16),
              if (_canResend)
                SizedBox(
                  width: double.infinity,
                  child: AppButton(text: "Kirim Ulang Kode", onPressed: _resendCode, variant: ButtonVariant.primary, mode: ButtonMode.outlined,)
                )
            ],
          ),
        ),
      ),
    );
  }
}
