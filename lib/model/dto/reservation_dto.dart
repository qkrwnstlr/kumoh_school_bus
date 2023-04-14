import 'package:kumoh_school_bus/model/dto/response_dto.dart';

class ReservationDTO implements ResponseDTO {
  final int id;
  final String from;
  final String to;
  final String by;
  final String when;

  ReservationDTO({
    required this.id,
    required this.from,
    required this.to,
    required this.by,
    required this.when,
  });

  @override
  ReservationDTO.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        from = json['from'],
        to = json['to'],
        by = json['by'],
        when = json['when'];
}
