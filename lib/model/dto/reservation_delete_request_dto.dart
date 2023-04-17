import 'package:kumoh_school_bus/model/dto/request_dto.dart';

class ReservationDeleteRequestDTO implements RequestDTO {
  String memberID;
  String reservationID;

  ReservationDeleteRequestDTO({
    required this.memberID,
    required this.reservationID,
  });

  @override
  Map<String, dynamic> toJson() => {
        'memberID': memberID,
        'reservationID': reservationID,
      };
}
