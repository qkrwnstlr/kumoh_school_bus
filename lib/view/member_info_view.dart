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
        builder: (context, provider, child) =>
            _MemberInfoPage(
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
        child: MemberInfoItem(
          userInfoDTO: _viewModel.memberInfoDTO!,
          onEditButtonClick: _viewModel.onEditButtonClick,
          passwordController: _viewModel.passwordController,
          checkPasswordController: _viewModel.checkPasswordController,
        ),
      ),
    );
  }
}

class MemberInfoItem extends StatelessWidget {
  final MemberInfoDTO userInfoDTO;
  final Future<bool> Function() onEditButtonClick;
  final TextEditingController passwordController;
  final TextEditingController checkPasswordController;

  const MemberInfoItem({
    Key? key,
    required this.userInfoDTO,
    required this.onEditButtonClick,
    required this.passwordController,
    required this.checkPasswordController,
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
            onPressed: () => _showCancelDialog(context),
            icon: const Icon(Icons.edit),
          ),
        ),
      ],
    );
  }

  Future<void> _showCancelDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '비밀번호 변경',
            style: TextStyleTheme.textMainStyleMiddle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TitledTextFormField(
                  labelText: "비밀번호",
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  validator: null,
                  controller: passwordController,
                ),
                TitledTextFormField(
                  labelText: "비밀번호",
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  validator: null,
                  controller: checkPasswordController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('예'),
              onPressed: () async {
                if(await onEditButtonClick()) {
                  Navigator.of(context).pop();
                }
              },
            ),
            TextButton(
              child: const Text('아니요'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
