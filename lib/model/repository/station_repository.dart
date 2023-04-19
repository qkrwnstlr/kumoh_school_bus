import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/base_repository.dart';

class StationRepository implements BaseRepository {
  @override
  String path = "/station";

  StationRepository._privateConstructor();

  static final StationRepository _instance =
      StationRepository._privateConstructor();

  factory StationRepository() {
    return _instance;
  }

  Future<List<StationDTO>> requestStationList() async {
    Map<String, dynamic>? response = await BaseRepository.get("$path/");
    if (response == null) {
      return [
        StationDTO(sId: "1", sName: "sName1", sLat: 35.8714354, sLng: 128.601445),
        StationDTO(sId: "2", sName: "sName2", sLat: 35.8714, sLng: 128.601),
      ];
    } else {
      return (response['data'] as List<dynamic>).map((e) => StationDTO.fromJson(e)).toList();
    }
  }
}
