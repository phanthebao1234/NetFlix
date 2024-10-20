import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/configs/theme/app_colors.dart';
import 'package:netflix/data/auth/models/signup_req_params.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';
import 'package:netflix/presentation/auth/pages/signin.dart';
import 'package:netflix/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _signupText(),
          const SizedBox(
            height: 30,
          ),
          _emailField(),
          const SizedBox(height: 20),
          _passwordField(),
          const SizedBox(height: 40),
          _signupButton(),
          const SizedBox(height: 20),
          _signinText(context),
        ],
      ),
    ));
  }

  Widget _signupText() {
    return const Text(
      "Sign Up",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: "Email",
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: "Password",
      ),
    );
  }

  Widget _signupButton() {
    return ReactiveButton(
      title: "Sign Up",
      activeColor: AppColors.primary,
      onPressed: () async {
        await sl<SignupUseCase>().call(
          params: SignupReqParams(
              email: _emailController.text, password: _passwordController.text),
        );
        
      },
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        const TextSpan(text: "If your have account ? "),
        TextSpan(
          text: "Sign In",
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SigninPage());
            },
        ),
      ],
    ));
  }
}
