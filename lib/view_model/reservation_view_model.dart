import 'package:flutter/cupertino.dart';

class ReservationViewModel extends ChangeNotifier {
  late String startTime;
  final List<String> startTimeList = ["value"];
  late String endTime = "value";
  final String endStation = "value";
  late String busNum;
  final List<String> busNumList = ["value"];
  final DateTime reservationDate = DateTime.now();
  late String seat;
  final List<String> seatList = ["value"];

  ReservationViewModel() {
    startTime = startTimeList[0];
    busNum = busNumList[0];
    seat = seatList[0];
  }

  void onStartTimeChanged(dynamic value) {
    startTime = value;
    endTime = value;
    notifyListeners();
  }

  void onBusNumChanged(dynamic value) {
    busNum = value;
    notifyListeners();
  }

  void onSeatChanged(dynamic value) {
    seat = value;
    notifyListeners();
  }

  void onReservationButtonClicked(BuildContext context) {
    Navigator.pushNamed(context, "/reservation/check");
  }
}