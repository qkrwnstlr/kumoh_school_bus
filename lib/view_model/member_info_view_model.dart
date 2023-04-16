import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/member_info_dto.dart';

class MemberInfoViewModel extends ChangeNotifier {
  final MemberInfoDTO userInfoDTO;
  MemberInfoViewModel({
    required this.userInfoDTO,
  });
}