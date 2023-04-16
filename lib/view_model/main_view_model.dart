import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/service/services.dart';
import 'package:kumoh_school_bus/util/date_format.dart';

import '../type/types.dart';

class MainViewModel extends ChangeNotifier {
  final BusService _searchBusService = BusService();

  Direction direction = Direction.toDaegu;
  DateTime reservationDate = DateTime.now();
  StationDTO? station;
  late List<StationDTO> stations;
  late Set<Marker> setOfMarkers;

  MainViewModel() {
    stations = _searchBusService.stationDTOList!;
    setOfMarkers = stations
        .map((e) => e.toMarker(() {
              station = e;
              notifyListeners();
            }))
        .toSet();
  }

  void onDirectionChange(dynamic value) {
    direction = value;
    notifyListeners();
  }

  void onReservationDateChanged(DateTime? value) {
    reservationDate = value ?? reservationDate;
    notifyListeners();
  }

  void navigateToReservationPage(BuildContext context, bool mounted) async {
    await _searchBusService.requestSearchBus(
      SearchRequestDTO(
        date: onlyDateFormat.format(reservationDate),
        type: direction.toString(),
        station: station!.sId,
      ),
    );
    if (mounted) {
      Navigator.pushNamed(
        context,
        "/reservation",
        arguments: {
          'station': station,
          'reservationDate': reservationDate,
        },
      );
    }
  }
}
