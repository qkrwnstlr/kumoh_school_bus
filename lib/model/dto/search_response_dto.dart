import 'package:kumoh_school_bus/model/dto/response_dto.dart';
import 'bus_time_seat_dto.dart';

class SearchResponseDTO implements ResponseDTO {
  final List<BusTimeSeatDTO> busTimeSeatList;

  SearchResponseDTO({
    required this.busTimeSeatList,
  });

  @override
  SearchResponseDTO.fromJson(Map<String, dynamic> json)
      : busTimeSeatList = json['busTimeSeatList'];
}
