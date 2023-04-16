import 'package:kumoh_school_bus/model/dto/dtos.dart';

class MemberRepository {
  MemberRepository._privateConstructor();

  MemberInfoDTO? _memberInfoDTO;
  MemberInfoDTO? get memberInfoDTO => _memberInfoDTO;

  static final MemberRepository _instance =
      MemberRepository._privateConstructor();

  factory MemberRepository() {
    return _instance;
  }

  Future login() async {
    _memberInfoDTO = MemberInfoDTO(
      name: "name",
      studentID: "studentID",
      major: "major",
    );
  }

  Future logout() async {
    _memberInfoDTO = null;
  }

  Future editInfo(MemberInfoDTO memberInfoDTO) async {
    _memberInfoDTO = memberInfoDTO;
  }
}
