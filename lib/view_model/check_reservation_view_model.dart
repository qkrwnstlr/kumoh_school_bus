import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';

class CheckReservationViewModel extends ChangeNotifier {
  final List<ReservationDTO> reservationList;
  CheckReservationViewModel({required this.reservationList});
}