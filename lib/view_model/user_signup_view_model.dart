import 'package:flutter/cupertino.dart';

class UserSignupViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;
  late final TextEditingController checkPasswordController;

  UserSignupViewModel() {
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