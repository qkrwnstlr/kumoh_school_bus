import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../type/types.dart';

class MainViewModel extends ChangeNotifier {
  Direction direction = Direction.toDaegu;
  DateTime reservationDate = DateTime.now();
  Set<Marker> setOfMarkers = {
    const Marker(
      markerId: MarkerId("markerId"),
      position: LatLng(35.8714354, 128.601445),
    )
  };

  void onDirectionChange(dynamic value) {
    direction = value;
    notifyListeners();
  }

  void onReservationDateChanged(DateTime? value) {
    reservationDate = value ?? reservationDate;
    notifyListeners();
  }

  void navigateToReservationPage(BuildContext context) {
    Navigator.pushNamed(context, "/reservation");
  }
}
