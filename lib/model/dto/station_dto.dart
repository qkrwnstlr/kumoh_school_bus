import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kumoh_school_bus/model/dto/response_dto.dart';

class StationDTO implements ResponseDTO {
  int sId;
  String sName;
  double sLat;
  double sLng;

  StationDTO({
    required this.sId,
    required this.sName,
    required this.sLat,
    required this.sLng,
  });

  @override
  StationDTO.fromJson(Map<String, dynamic> json)
      : sId = json['s_id'],
        sName = json['sName'],
        sLat = json['s_lat'],
        sLng = json['s_lng'];

  Marker toMarker() => Marker(
    markerId: MarkerId("$sId"),
    position: LatLng(sLat, sLng),
    infoWindow: InfoWindow(title: sName),
  );
}
