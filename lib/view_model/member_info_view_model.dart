import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/repositories.dart';

class MemberInfoViewModel extends ChangeNotifier {
  final MemberRepository _memberRepository = MemberRepository();

  MemberInfoDTO? get memberInfoDTO =>
      _memberRepository.memberInfoDTO ??
      MemberInfoDTO(name: "name", studentID: "studentID", major: "major");
}
