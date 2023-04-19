import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/login_dto.dart';
import 'package:kumoh_school_bus/type/member_type.dart';

import '../model/service/services.dart';

class LoginViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;

  final MemberService _memberService = MemberService();

  LoginViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  void login(BuildContext context, bool mounted) async {
    await _memberService.login(LoginDTO(
      id: idController.text,
      password: passwordController.text,
    ));
    if (mounted) {
      if(_memberService.memberInfoDTO!.type == MemberType.driver){
        Navigator.pushNamedAndRemoveUntil(context, "/driver", (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      }
    }
  }

  void navigateToUserSignupPage(BuildContext context) {
    Navigator.pushNamed(context, "/signup/user");
  }
}
