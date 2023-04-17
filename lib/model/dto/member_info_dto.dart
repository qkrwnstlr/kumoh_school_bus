import 'package:kumoh_school_bus/model/dto/request_dto.dart';
import 'package:kumoh_school_bus/model/dto/response_dto.dart';
import 'package:kumoh_school_bus/type/types.dart';

class MemberInfoDTO implements RequestDTO, ResponseDTO {
  String name;
  String id;
  String major;
  MemberType type;

  MemberInfoDTO({
    required this.name,
    required this.id,
    required this.major,
    required this.type,
  });

  MemberInfoDTO.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        major = json['major'],
        type = MemberType.fromString(json['type']);

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'major': major,
        'type': type.toString(),
      };
}
