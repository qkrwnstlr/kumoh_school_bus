import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/service/member_service.dart';
import 'package:kumoh_school_bus/model/service/reservation_service.dart';

class CheckReservationViewModel extends ChangeNotifier {
  final ReservationService _reservationService = ReservationService();
  final MemberService _memberService = MemberService();
  late List<ReservationDTO> reservationList = [];

  CheckReservationViewModel() {
    _reservationService.requestReservationList(_memberService.memberInfoDTO!.id).then((value) {
      reservationList = _reservationService.reservationDTOList;
      notifyListeners();
    });
  }

  Future onCancelButtonClick(String reservationId) async {
    await _reservationService
        .requestDeleteReservation(reservationId, _memberService.memberInfoDTO!.id);
    notifyListeners();
  }
}
