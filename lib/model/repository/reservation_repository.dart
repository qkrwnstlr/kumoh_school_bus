import 'package:kumoh_school_bus/model/dto/bus_time_reservation_dto.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/base_repository.dart';
import 'package:kumoh_school_bus/type/types.dart';

class ReservationRepository implements BaseRepository {
  @override
  String path = "/reservation";

  ReservationRepository._privateConstructor();

  static final ReservationRepository _instance =
      ReservationRepository._privateConstructor();

  factory ReservationRepository() {
    return _instance;
  }

  Future<BusTimeReservationDTO> requestReservationListByBus(String busTimeId) async {
    Map<String, dynamic>? json = await BaseRepository.get("$path/bus/$busTimeId");
    if(json == null) throw Exception("request json is null");
    return BusTimeReservationDTO.fromJson(json);
  }

  Future<List<ReservationDTO>> requestReservationListByMember(String memberId) async {
    Map<String, dynamic>? json = await BaseRepository.get("$path/$memberId");
    if (json == null) {
      return [
        ReservationDTO(id: "1", type: Direction.toDaegu, station: "from", by: "by", when: "when", seatNum: 1),
        ReservationDTO(id: "2", type: Direction.toDaegu, station: "from", by: "by", when: "when", seatNum: 2),
      ];
    } else {
      return (json["data"] as List<dynamic>)
          .map((e) => ReservationDTO.fromJson(e))
          .toList();
    }
  }

  Future<List<ReservationDTO>> requestAddReservation(
      ReservationAddRequestDTO requestDTO, String memberId) async {
    Map<String, dynamic>? json = await BaseRepository.post("$path/$memberId", requestDTO.toJson());
    if(json == null) {
      return [
        ReservationDTO(id: "1", type: Direction.toDaegu, station: "to", by: "by", when: "when", seatNum: 1),
        ReservationDTO(id: "2", type: Direction.toDaegu, station: "from", by: "by", when: "when", seatNum: 2),
      ];
    } else {
      return (json["data"] as List<dynamic>)
          .map((e) => ReservationDTO.fromJson(e))
          .toList();
    }
  }

  Future<List<ReservationDTO>> requestDeleteReservation(
      String reservationId, String memberId) async {
    Map<String, dynamic>? json = await BaseRepository.delete("$path/$memberId/$reservationId");
    if(json == null) {
      return [
        ReservationDTO(id: "1", type: Direction.toDaegu, station: "to", by: "by", when: "when", seatNum: 1),
        ReservationDTO(id: "2", type: Direction.toDaegu, station: "from", by: "by", when: "when", seatNum: 2),
      ];
    } else {
      return (json["data"] as List<dynamic>)
          .map((e) => ReservationDTO.fromJson(e))
          .toList();
    }
  }
}
