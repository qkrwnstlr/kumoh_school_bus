import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;

  LoginViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  void login(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  }

  void navigateToUserSignupPage(BuildContext context) {
    Navigator.pushNamed(context, "/user/signup");
  }
}