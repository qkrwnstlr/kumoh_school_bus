import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/service/reservation_service.dart';

class CheckReservationViewModel extends ChangeNotifier {
  final ReservationService _reservationService = ReservationService();
  late List<ReservationDTO> reservationList;
  CheckReservationViewModel() {
    reservationList = _reservationService.reservationDTOList!;
  }
}