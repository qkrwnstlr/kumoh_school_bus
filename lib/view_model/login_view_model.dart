import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;

  LoginViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  void login(BuildContext context) {

  }

  void navigateToUserSignupPage(BuildContext context) {
    Navigator.pushNamed(context, "/signup/user");
  }
}