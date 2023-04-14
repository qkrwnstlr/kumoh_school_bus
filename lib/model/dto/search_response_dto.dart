import 'package:kumoh_school_bus/model/dto/response_dto.dart';
import 'bus_dto.dart';

class SearchResponseDTO implements ResponseDTO {
  final List<BusDTO> busList;

  SearchResponseDTO({
    required this.busList,
  });

  @override
  SearchResponseDTO.fromJson(Map<String, dynamic> json)
      : busList = json['busTimeSeatList'];
}
