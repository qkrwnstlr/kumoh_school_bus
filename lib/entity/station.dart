import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kumoh_school_bus/entity/entity.dart';

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
  Station.fromJson(Map<String, dynamic> json)
      : sId = json['s_id'],
        sName = json['sName'],
        sLat = json['s_lat'],
        sLng = json['s_lng'];

  @override
  Map<String, dynamic> toJson() => {
        's_id': sId,
        's_name': sName,
        's_lat': sLat,
        's_lng': sLng,
      };

  Marker toMarker() => Marker(
        markerId: MarkerId("$sId"),
        position: LatLng(sLat, sLng),
        infoWindow: InfoWindow(title: sName),
      );
}
