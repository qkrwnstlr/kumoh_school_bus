import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/repositories.dart';

class ReservationService {
  final ReservationRepository _repository = ReservationRepository();

  ReservationService._privateConstructor();

  static final ReservationService _instance =
      ReservationService._privateConstructor();

  factory ReservationService() {
    return _instance;
  }

  final List<ReservationDTO> _reservationDTOList = [];

  List<ReservationDTO> get reservationDTOList => _reservationDTOList;

  Future requestReservationList(String memberId) async {
    _reservationDTOList.clear();
    _reservationDTOList
        .addAll(await _repository.requestReservationList(memberId));
  }

  Future requestDeleteReservation(String reservationId, String memberId) async {
    _reservationDTOList.clear();
    _reservationDTOList.addAll(
        await _repository.requestDeleteReservation(reservationId, memberId));
  }

  Future requestAddReservation(
      ReservationAddRequestDTO requestDTO, String memberId) async {
    _reservationDTOList.clear();
    _reservationDTOList
        .addAll(await _repository.requestAddReservation(requestDTO, memberId));
  }
}
