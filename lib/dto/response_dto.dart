import 'package:kumoh_school_bus/dto/dto.dart';

abstract class ResponseDTO implements DTO {
  ResponseDTO.fromJson(Map<String,dynamic> json);
}