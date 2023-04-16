import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/user_info_dto.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view_model/user_info_view_model.dart';
import 'package:provider/provider.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return ChangeNotifierProvider<UserInfoViewModel>(
      create: (_) => UserInfoViewModel(
        userInfoDTO: arguments['userInfoDTO'] ??
            UserInfoDTO(name: "name", studentID: "studentID", major: "major"),
      ),
      child: Consumer<UserInfoViewModel>(
        builder: (context, provider, child) => _UserInfoPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _UserInfoPage extends StatefulWidget {
  final UserInfoViewModel viewModel;

  const _UserInfoPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<_UserInfoPage> {
  late final UserInfoViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VanillaAppBar.build(context, title: "Kumoh School Bus"),
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: UserInfoItem(userInfoDTO: _viewModel.userInfoDTO),
      ),
    );
  }
}

class UserInfoItem extends StatelessWidget {
  final UserInfoDTO userInfoDTO;

  const UserInfoItem({
    Key? key,
    required this.userInfoDTO,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorTheme.itemMainColor,
            borderRadius: BorderRadius.circular(SizeTheme.borderRadiusSize),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(SizeTheme.paddingLargeSize),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: ColorTheme.backgroundMainColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(SizeTheme.paddingLargeSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitledText(
                        title: "이름",
                        text: userInfoDTO.name,
                        backgroundColor: ColorTheme.backgroundMainColor,
                      ),
                      const SizedBox(height: SizeTheme.paddingMiddleSize),
                      TitledText(
                        title: "학번",
                        text: userInfoDTO.studentID,
                        backgroundColor: ColorTheme.backgroundMainColor,
                      ),
                      const SizedBox(height: SizeTheme.paddingMiddleSize),
                      TitledText(
                        title: "학과",
                        text: userInfoDTO.major,
                        backgroundColor: ColorTheme.backgroundMainColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: SizeTheme.paddingSmallSize,
          right: SizeTheme.paddingLargeSize,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ),
      ],
    );
  }
}
