import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/member_info_dto.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';
import 'package:kumoh_school_bus/view_model/member_info_view_model.dart';
import 'package:provider/provider.dart';

class MemberInfoView extends StatelessWidget {
  const MemberInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemberInfoViewModel>(
      create: (_) => MemberInfoViewModel(),
      child: Consumer<MemberInfoViewModel>(
        builder: (context, provider, child) => _MemberInfoPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _MemberInfoPage extends StatefulWidget {
  final MemberInfoViewModel viewModel;

  const _MemberInfoPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_MemberInfoPage> createState() => _MemberInfoPageState();
}

class _MemberInfoPageState extends State<_MemberInfoPage> {
  late final MemberInfoViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return DrawerAppBarScaffold(
      appBarTitle: 'Kumoh School Bus',
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: MemberInfoItem(userInfoDTO: _viewModel.memberInfoDTO!),
      ),
    );
  }
}

class MemberInfoItem extends StatelessWidget {
  final MemberInfoDTO userInfoDTO;

  const MemberInfoItem({
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
