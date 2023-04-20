import 'package:kumoh_school_bus/model/dto/bus_time_reservation_dto.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/base_repository.dart';

class ReservationRepository implements BaseRepository {
  @override
  String path = "/reservation";

  ReservationRepository._privateConstructor();

  static final ReservationRepository _instance =
      ReservationRepository._privateConstructor();

  factory ReservationRepository() {
    return _instance;
  }

  Future<BusTimeReservationDTO> requestReservationListByBus(
      String busTimeId) async {
    Map<String, dynamic> json =
        await BaseRepository.get("$path/bus/$busTimeId");
    return BusTimeReservationDTO.fromJson(json);
  }

  Future<List<ReservationDTO>> requestReservationListByMember(
      String memberId) async {
    Map<String, dynamic> json = await BaseRepository.get("$path/$memberId");
    return (json["data"] as List<dynamic>)
        .map((e) => ReservationDTO.fromJson(e))
        .toList();
  }

  Future<List<ReservationDTO>> requestAddReservation(
      ReservationAddRequestDTO requestDTO, String memberId) async {
    Map<String, dynamic> json =
        await BaseRepository.post("$path/$memberId", requestDTO.toJson());
    return (json["data"] as List<dynamic>)
        .map((e) => ReservationDTO.fromJson(e))
        .toList();
  }

  Future<List<ReservationDTO>> requestDeleteReservation(
      String reservationId, String memberId) async {
    Map<String, dynamic> json =
        await BaseRepository.delete("$path/$memberId/$reservationId");
    return (json["data"] as List<dynamic>)
        .map((e) => ReservationDTO.fromJson(e))
        .toList();
  }
}
