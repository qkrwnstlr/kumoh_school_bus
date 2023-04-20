import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/login_dto.dart';
import 'package:kumoh_school_bus/type/member_type.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';

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
    await _memberService.login(LoginDTO(
      id: idController.text,
      password: passwordController.text,
    ));
    if (mounted) {
      if (_memberService.memberInfoDTO!.type == MemberType.driver) {
        DrawerAppBarScaffoldController().changeDrawerItems({
          "Home": (context) => Navigator.popAndPushNamed(context, '/driver'),
          "UserInfo": (context) =>
              Navigator.popAndPushNamed(context, '/user/info'),
          "Logout": (context) {
            MemberService().logout();
            Navigator.pushNamedAndRemoveUntil(
                context, "/login", (route) => false);
          },
        });
        await _busService.requestSelectBus();
        if(mounted) {
          Navigator.pushNamedAndRemoveUntil(context, "/driver/select", (route) => false);
        }
      } else {
        DrawerAppBarScaffoldController().changeDrawerItems({
          "Home": (context) => Navigator.popAndPushNamed(context, '/'),
          "UserInfo": (context) =>
              Navigator.popAndPushNamed(context, '/user/info'),
          "Reservation": (context) =>
              Navigator.popAndPushNamed(context, '/reservation/check'),
          "Logout": (context) {
            MemberService().logout();
            Navigator.pushNamedAndRemoveUntil(
                context, "/login", (route) => false);
          },
        });
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      }
    }
  }

  void navigateToUserSignupPage(BuildContext context) {
    Navigator.pushNamed(context, "/signup/user");
  }
}
