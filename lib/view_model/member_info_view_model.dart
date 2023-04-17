import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';

import '../model/service/services.dart';

class MemberInfoViewModel extends ChangeNotifier {
  final MemberService _memberService = MemberService();

  MemberInfoDTO? get memberInfoDTO => _memberService.memberInfoDTO;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkPasswordController = TextEditingController();

  Future<bool> onEditButtonClick() async {
    if (passwordController.text == checkPasswordController.text &&
        passwordController.text != "") {
      await _memberService.editInfo(passwordController.text);
      return true;
    }
    return false;
  }

  Future onRemoveButtonClick(BuildContext context, bool mounted) async {
    await _memberService.removeMember();
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    }
  }
}
