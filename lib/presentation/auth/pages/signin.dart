import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/helper/message/display_message.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/configs/theme/app_colors.dart';
import 'package:netflix/data/auth/models/signin_req_params.dart';
import 'package:netflix/domain/auth/usecases/signin.dart';
import 'package:netflix/presentation/auth/pages/signup.dart';
import 'package:netflix/presentation/home/pages/home.dart';
import 'package:netflix/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

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
          _signinText(),
          const SizedBox(
            height: 30,
          ),
          _emailField(),
          const SizedBox(height: 20),
          _passwordField(),
          const SizedBox(height: 40),
          _signinButton(context),
          const SizedBox(height: 20),
          _signupText(context),
        ],
      ),
    ));
  }

  Widget _signinText() {
    return const Text(
      "Sign in",
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

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: "Sign In",
      activeColor: AppColors.primary,
      onPressed: () async {
        return await sl<SigninUseCase>().call(
          params: SigninReqParams(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        // Xuất thông báo lỗi
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        const TextSpan(text: "Don't you have account ?"),
        TextSpan(
          text: "Sign Up",
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print('run here');
              AppNavigator.push(context, SignupPage());
            },
        ),
      ],
    ));
  }
}
