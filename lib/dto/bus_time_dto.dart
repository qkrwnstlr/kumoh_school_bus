import 'package:kumoh_school_bus/dto/response_dto.dart';

class BusTimeDTO implements ResponseDTO {
  String busNum;
  List<String> startTimeList;
  List<String> endTimeList;

  BusTimeDTO({
    required this.busNum,
    required this.startTimeList,
    required this.endTimeList,
  });

  @override
  BusTimeDTO.fromJson(Map<String, dynamic> json)
      : busNum = json['busNum'],
        startTimeList = json['startTimeList'],
        endTimeList = json['endTimeList'];
}
