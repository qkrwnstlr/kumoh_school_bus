import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/service/services.dart';
import 'package:kumoh_school_bus/type/types.dart';

class DriverSignupViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;
  late final TextEditingController checkPasswordController;
  late final TextEditingController nameController;

  final MemberService _memberService = MemberService();

  DriverSignupViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    checkPasswordController = TextEditingController(text: '');
    nameController = TextEditingController(text: '');
  }

  void signup(BuildContext context, bool mounted) async {
    await _memberService.signup(MemberInfoDTO(
      id: idController.text,
      password: passwordController.text,
      type: MemberType.driver,
      name: nameController.text,
      major: Major.driver,
    ));
    if(mounted) Navigator.pop(context);
  }

  void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }
}
