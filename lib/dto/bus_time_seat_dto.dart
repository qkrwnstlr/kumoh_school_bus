import 'package:kumoh_school_bus/dto/bus_time_dto.dart';
import 'package:kumoh_school_bus/dto/response_dto.dart';

class BusTimeSeatDTO implements ResponseDTO {
  bool isReserved;
  int seatNum;
  BusTimeDTO busTimeDTO;

  BusTimeSeatDTO({
    required this.isReserved,
    required this.seatNum,
    required this.busTimeDTO,
  });

  @override
  BusTimeSeatDTO.fromJson(Map<String, dynamic> json)
      : isReserved = json['isReserved'],
        seatNum = json['seatNum'],
        busTimeDTO = BusTimeDTO.fromJson(json['busTimeDTO']);
}
