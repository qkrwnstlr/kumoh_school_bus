import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/bus_time_reservation_dto.dart';
import 'package:kumoh_school_bus/model/service/bus_time_reservation_service.dart';

class DriverViewModel extends ChangeNotifier {
  final BusTimeSeatReservationService _reservationService = BusTimeSeatReservationService();
  late BusTimeReservationDTO busTimeReservation;

  DriverViewModel() {
    busTimeReservation = _reservationService.busTimeSeatReservationDTO;
  }
}