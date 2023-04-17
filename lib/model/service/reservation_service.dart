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

  List<ReservationDTO>? _reservationDTOList;

  List<ReservationDTO>? get reservationDTOList => _reservationDTOList;

  Future requestReservationList() async {
    _reservationDTOList = await _repository.requestReservationList();
  }

  Future requestDeleteReservation(ReservationDeleteRequestDTO requestDTO) async {
    _reservationDTOList = await _repository.requestDeleteReservation(requestDTO);
  }

  Future requestAddReservation(ReservationAddRequestDTO requestDTO) async {
    _reservationDTOList = await _repository.requestAddReservation(requestDTO);
  }
}
