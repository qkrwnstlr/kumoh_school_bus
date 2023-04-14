import 'package:kumoh_school_bus/dto/response_dto.dart';

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
}
