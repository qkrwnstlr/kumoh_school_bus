import 'package:kumoh_school_bus/dto/dto.dart';

abstract class RequestDTO implements DTO{
  Map<String, dynamic> toJson();
}