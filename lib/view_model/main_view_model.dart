import 'package:flutter/cupertino.dart';

import '../type/types.dart';

class MainViewModel extends ChangeNotifier {
  Direction direction = Direction.toDaegu;
  DateTime reservationDate = DateTime.now();

  void onDirectionChange(dynamic value) {
    direction = value;
    notifyListeners();
  }

  void onReservationDateChanged(DateTime value) {
    reservationDate = value;
    notifyListeners();
  }
}