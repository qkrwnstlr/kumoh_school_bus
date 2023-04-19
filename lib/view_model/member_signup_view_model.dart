import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/service/services.dart';
import 'package:kumoh_school_bus/type/types.dart';

class MemberSignupViewModel extends ChangeNotifier {
  late final TextEditingController idController;
  late final TextEditingController passwordController;
  late final TextEditingController checkPasswordController;
  late final TextEditingController nameController;

  late List<Major> majorList;
  late int majorIndex;
  late Major major;

  final MemberService _memberService = MemberService();

  MemberSignupViewModel() {
    idController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    checkPasswordController = TextEditingController(text: '');
    nameController = TextEditingController(text: '');
    majorList = [...Major.values.where((element) => element != Major.driver)];
    majorIndex = 0;
    major = majorList[majorIndex];
  }

  void onMajorChanged(dynamic value) {
    majorIndex = majorList.indexOf(value);
    major = majorList[majorIndex];
    notifyListeners();
  }

  void signup(BuildContext context, bool mounted) async {
    await _memberService.signup(MemberInfoDTO(
      id: idController.text,
      password: passwordController.text,
      type: MemberType.member,
      name: nameController.text,
      major: major,
    ));
    if (mounted) Navigator.pop(context);
  }

  void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToDriverSignupPage(BuildContext context) {
    Navigator.pushNamed(context, "/signup/driver")
        .then((value) => Navigator.pop(context));
  }
}
