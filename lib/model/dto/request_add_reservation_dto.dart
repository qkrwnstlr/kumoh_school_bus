import 'package:kumoh_school_bus/model/dto/request_dto.dart';

class RequestAddReservationDTO implements RequestDTO {
  final String from;
  final String to;
  final String by;
  final String when;

  RequestAddReservationDTO({
    required this.from,
    required this.to,
    required this.by,
    required this.when,
  });

  @override
  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'by': by,
        'when': when,
      };
}
