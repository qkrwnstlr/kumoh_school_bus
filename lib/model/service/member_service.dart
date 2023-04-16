import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/member_repository.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';

class MemberService {
  MemberService._privateConstructor();

  final MemberRepository _repository = MemberRepository();

  MemberInfoDTO? _memberInfoDTO;

  MemberInfoDTO? get memberInfoDTO => _memberInfoDTO;

  static final MemberService _instance = MemberService._privateConstructor();

  factory MemberService() {
    return _instance;
  }

  Future login() async {
    _memberInfoDTO = await _repository.login();
    DrawerAppBarScaffoldController().changeMemberInfo(
      _memberInfoDTO!.name,
      _memberInfoDTO!.studentID,
    );
  }

  Future logout() async {
    _memberInfoDTO = null;
  }

  Future editInfo(MemberInfoDTO memberInfoDTO) async {
    _memberInfoDTO = await editInfo(memberInfoDTO);
    DrawerAppBarScaffoldController().changeMemberInfo(
      _memberInfoDTO!.name,
      _memberInfoDTO!.studentID,
    );
  }
}
