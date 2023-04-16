import 'package:flutter/material.dart';

class MemberSignupViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;
  late final TextEditingController checkPasswordController;

  MemberSignupViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    checkPasswordController = TextEditingController(text: '');
  }

  void signup(BuildContext context) {

  }

  void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToDriverSignupPage(BuildContext context) {

  }
}