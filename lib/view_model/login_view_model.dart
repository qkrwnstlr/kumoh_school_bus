import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/repository/repositories.dart';

class LoginViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;

  final MemberRepository _memberRepository = MemberRepository();

  LoginViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  void login(BuildContext context, bool mounted) async {
    await _memberRepository.login();
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    }
  }

  void navigateToUserSignupPage(BuildContext context) {
    Navigator.pushNamed(context, "/user/signup");
  }
}
