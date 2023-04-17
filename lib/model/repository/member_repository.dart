import 'package:kumoh_school_bus/model/dto/dtos.dart';

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
      studentID: "studentID",
      major: "major",
    );
  }

  Future editInfo(String password) async {}
}
