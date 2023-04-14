import 'package:kumoh_school_bus/model/dto/response_dto.dart';

class BusTimeDTO implements ResponseDTO {
  String startTime;
  String endTime;

  BusTimeDTO({
    required this.startTime,
    required this.endTime,
  });

  @override
  BusTimeDTO.fromJson(Map<String, dynamic> json)
      : startTime = json['startTimeList'],
        endTime = json['endTimeList'];

  @override
  String toString() => startTime;
}
