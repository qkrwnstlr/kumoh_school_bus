import 'package:flutter/cupertino.dart';

class ReservationViewModel extends ChangeNotifier {
  final String startTime = "value";
  final List<String> startTimeList = ["value"];
  final String endTime = "value";
  final String endStation = "value";
  final String busNum = "value";
  final List<String> busNumList = ["value"];
  final DateTime reservationDate = DateTime.now();
  final String seat = "value";
  final List<String> seatList = ["value"];

  void onReservationButtonClicked(BuildContext context) {
    Navigator.pushNamed(context, "/reservation/check");
  }
}