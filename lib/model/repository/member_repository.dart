import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/type/member_type.dart';

class MemberRepository {
  MemberRepository._privateConstructor();

  static final MemberRepository _instance =
      MemberRepository._privateConstructor();

  factory MemberRepository() {
    return _instance;
  }

  Future<MemberInfoDTO> login() async {
    return MemberInfoDTO(
      name: "name",
      id: "studentID",
      major: "major",
      type: MemberType.member,
    );
  }

  Future editInfo(String password) async {}

  Future removeMember(String id) async {}
}
