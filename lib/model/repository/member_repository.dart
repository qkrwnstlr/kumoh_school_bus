import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/repository/base_repository.dart';
import 'package:kumoh_school_bus/type/member_type.dart';

class MemberRepository implements BaseRepository {
  @override
  String path = "/auth";

  MemberRepository._privateConstructor();

  static final MemberRepository _instance =
      MemberRepository._privateConstructor();

  factory MemberRepository() {
    return _instance;
  }

  Future<MemberInfoDTO> login(LoginDTO loginDTO) async {
    Map<String, dynamic>? response =
        await BaseRepository.post('$path/signin', loginDTO.toJson());
    print(response);
    if (response == null) {
      return MemberInfoDTO(
        name: "name",
        id: "studentID",
        password: "password",
        major: "major",
        type: MemberType.member,
      );
    } else {
      BaseRepository.setToken(response["token"]);
      return MemberInfoDTO.fromJson(response);
    }
  }

  Future signup(MemberInfoDTO signupDTO) async {
    await BaseRepository.post('$path/signup', signupDTO.toJson());
  }

  Future editInfo(String id, String password) async {
    await BaseRepository.put('$path/edit', {
      'loginId': id,
      'password': password,
    });
  }

  void logout() {
    BaseRepository.removeToken();
  }

  Future removeMember(String id) async {
    BaseRepository.removeToken();
    await BaseRepository.delete('$path/remove/$id');
  }
}
