import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/service/services.dart';
import 'package:kumoh_school_bus/type/types.dart';

class MemberSignupViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;
  late final TextEditingController checkPasswordController;

  final MemberService _memberService = MemberService();

  MemberSignupViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    checkPasswordController = TextEditingController(text: '');
  }

  void signup(BuildContext context, bool mounted) async {
    await _memberService.signup(MemberInfoDTO(
      id: idController.text,
      password: passwordController.text,
      type: MemberType.member,
      name: '박준식',
      major: '컴퓨터공학과',
    ));
    if(mounted) Navigator.pop(context);
  }

  void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToDriverSignupPage(BuildContext context) {}
}
