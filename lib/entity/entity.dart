import '../model/dto/dto.dart';

abstract class Entity {
  Entity.fromDTO(Map<String, DTO> dtos);
  Map<String, DTO> toDTO();
}