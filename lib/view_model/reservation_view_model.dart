import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';

import '../model/service/services.dart';

class ReservationViewModel extends ChangeNotifier {
  final MemberService _memberService = MemberService();
  final BusService _searchBusService = BusService();

  late SearchResponseDTO searchResponseDTO;
  final StationDTO station;
  final DateTime reservationDate;

  late List<BusDTO> busList;
  late int busIndex;
  late BusDTO bus;

  late List<BusTimeSeatDTO> busTimeSeatList;

  late List<BusTimeDTO> busTimeList;
  late int busTimeIndex;
  late BusTimeDTO currentTime;

  late List<int> seatList;
  late int seatIndex;
  late int seat;

  ReservationViewModel({
    required this.station,
    required this.reservationDate,
  }) {
    searchResponseDTO = _searchBusService.searchResponseDTO!;
    busList = searchResponseDTO.busList;
    _setBusIndex(0);
  }

  void _setSeatIndex(int index) {
    seatIndex = index;
    seat = seatList[index];
  }

  void _setBusTimeIndex(int index) {
    busTimeIndex = index;
    currentTime = busTimeList[busTimeIndex];
    seatList = busTimeSeatList[busTimeIndex].timeSeatList.map((e) => e.seatNum).toList();
    _setSeatIndex(0);
  }

  void _setBusIndex(int index) {
    busIndex = index;
    busTimeSeatList = busList[busIndex].busTimeSeatList;
    busTimeList = busTimeSeatList.map((e) => e.busTimeDTO).toList();
    bus = busList[busIndex];
    _setBusTimeIndex(0);
  }

  void onStartTimeChanged(dynamic value) {
    _setBusTimeIndex(busTimeList.indexOf(value));
    notifyListeners();
  }

  void onBusNumChanged(dynamic value) {
    _setBusIndex(busList.indexOf(value));
    notifyListeners();
  }

  void onSeatChanged(dynamic value) {
    _setSeatIndex(seatList.indexOf(value));
    notifyListeners();
  }

  void onReservationButtonClicked(BuildContext context) {
    Navigator.pushNamed(context, "/reservation/check");
  }

  @override
  void dispose() {
    _searchBusService.clearSearchResponseDTO();
    super.dispose();
  }
}
