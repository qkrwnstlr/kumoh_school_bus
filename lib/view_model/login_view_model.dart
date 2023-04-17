import 'package:flutter/material.dart';

import '../model/service/services.dart';

class LoginViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;

  final MemberService _memberService = MemberService();
  final BusService _busService = BusService();

  LoginViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  void login(BuildContext context, bool mounted) async {
    await _memberService.login();
    await _busService.requestStationList();
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    }
  }

  void navigateToUserSignupPage(BuildContext context) {
    Navigator.pushNamed(context, "/user/signup");
  }
}
