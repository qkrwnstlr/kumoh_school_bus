import 'package:kumoh_school_bus/dto/dto.dart';

abstract class Entity {
  Entity.fromDTO(Map<String, DTO> dtos);
  Map<String, DTO> toDTO();
}