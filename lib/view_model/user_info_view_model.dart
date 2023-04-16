import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/user_info_dto.dart';

class UserInfoViewModel extends ChangeNotifier {
  final UserInfoDTO userInfoDTO;
  UserInfoViewModel({
    required this.userInfoDTO,
  });
}