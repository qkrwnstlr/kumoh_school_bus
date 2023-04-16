import 'package:kumoh_school_bus/model/dto/dtos.dart';

class ReservationRepository {
  ReservationRepository._privateConstructor();

  static final ReservationRepository _instance =
      ReservationRepository._privateConstructor();

  factory ReservationRepository() {
    return _instance;
  }

  Future<List<ReservationDTO>> requestReservationList() async {
    return [
      ReservationDTO(id: 1, from: "from", to: "to", by: "by", when: "when"),
      ReservationDTO(id: 2, from: "from", to: "to", by: "by", when: "when"),
    ];
  }

  Future<List<ReservationDTO>> requestAddReservation(
      RequestAddReservationDTO requestDTO) async {
    return [
      ReservationDTO(id: 1, from: "from", to: "to", by: "by", when: "when"),
      ReservationDTO(id: 2, from: "from", to: "to", by: "by", when: "when"),
      ReservationDTO(
        id: 3,
        from: requestDTO.from,
        to: requestDTO.to,
        by: requestDTO.by,
        when: requestDTO.when,
      ),
    ];
  }
}
