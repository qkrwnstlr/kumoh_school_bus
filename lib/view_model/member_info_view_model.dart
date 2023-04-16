import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';

import '../model/service/services.dart';

class MemberInfoViewModel extends ChangeNotifier {
  final MemberService _memberService = MemberService();

  MemberInfoDTO? get memberInfoDTO =>
      _memberService.memberInfoDTO ??
      MemberInfoDTO(name: "name", studentID: "studentID", major: "major");
}
