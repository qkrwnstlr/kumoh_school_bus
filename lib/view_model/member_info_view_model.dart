import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/user_info_dto.dart';

class MemberInfoViewModel extends ChangeNotifier {
  final UserInfoDTO userInfoDTO;
  MemberInfoViewModel({
    required this.userInfoDTO,
  });
}