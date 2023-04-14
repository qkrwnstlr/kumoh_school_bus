import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kumoh_school_bus/entity/entity.dart';
import 'package:kumoh_school_bus/model/dto/dto.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';

class Station implements Entity {
  int sId;
  String sName;
  double sLat;
  double sLng;

  Station({
    required this.sId,
    required this.sName,
    required this.sLat,
    required this.sLng,
  });

  @override
  Station.fromJson(Map<String, DTO> dtos)
      : sId = (dtos['stationDTO'] as StationDTO).sId,
        sName = (dtos['stationDTO'] as StationDTO).sName,
        sLat = (dtos['stationDTO'] as StationDTO).sLat,
        sLng = (dtos['stationDTO'] as StationDTO).sLng;

  @override
  Map<String, DTO> toDTO() => {
        'stationDTO': StationDTO(
          sId: sId,
          sName: sName,
          sLat: sLat,
          sLng: sLng,
        ),
      };

  Marker toMarker() => Marker(
        markerId: MarkerId("$sId"),
        position: LatLng(sLat, sLng),
        infoWindow: InfoWindow(title: sName),
      );
}
