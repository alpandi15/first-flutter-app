import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:identix_connect/widgets/buttons/button.dart';
import 'package:identix_connect/widgets/images/image.dart';
import 'package:identix_connect/widgets/inputs/input_field.dart';
import 'package:identix_connect/widgets/layouts/footer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  final AutovalidateMode _mode = AutovalidateMode.onUserInteraction;

  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState!.value;
      debugPrint("Login Data: $formData");

      setState(() {
        _isSubmitting = true;
      });

      // simpan navigator sebelum async gap
      final router = GoRouter.of(context);

      Future.delayed(const Duration(seconds: 1)).then((_) {
        if (!mounted) return;
        setState(() {
          _isSubmitting = false;
        });
        router.push('/otp'); // tidak lagi pakai context
      });
    } else {
      debugPrint("Validation failed");
    }
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // warna panel atas khusus halaman ini
        statusBarIconBrightness: Brightness.dark, // icon putih
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: _mode,
              onChanged: () {
                setState(() {});
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bagian atas -> logo + form
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo
                      AppImage(
                        path: "assets/images/logo_app.png",
                        width: 120,
                        height: 60.22,
                      ),

                      const SizedBox(height: 64), // spasi setelah logo

                      // Form login
                      const Text(
                        "Masuk",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const Text("ke akun anda!"),
                      const SizedBox(height: 24),

                      AppInputField(
                        name: 'email',
                        label: "Email",
                        hint: "e.g johnwick@mail.com",
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Email tidak boleh kosong"),
                          FormBuilderValidators.email(
                              errorText: "Format email tidak valid"),
                        ]),
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          text: "Login",
                          // onPressed: null,
                          onPressed: !_isSubmitting
                              ? () => _onSubmit(context)
                              : null,
                        ),
                      ),
                    ]
                  ),
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
