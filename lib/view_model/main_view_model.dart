import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';

import '../type/types.dart';

class MainViewModel extends ChangeNotifier {
  Direction direction = Direction.toDaegu;
  DateTime reservationDate = DateTime.now();
  List<StationDTO> stations = [
    StationDTO(sId: 1, sName: "sName1", sLat: 35.8714354, sLng: 128.601445),
    StationDTO(sId: 2, sName: "sName2", sLat: 35.8714, sLng: 128.601),
  ];
  late Set<Marker> setOfMarkers;

  void initMarkers() =>
      setOfMarkers = stations.map((e) => e.toMarker()).toSet();

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
