import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/view_model/user_signup_view_model.dart';
import 'package:provider/provider.dart';

import '../theme/themes.dart';
import 'common/commons.dart';

class UserSignupView extends StatelessWidget {
  const UserSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserSignupViewModel>(
      create: (_) => UserSignupViewModel(),
      child: Consumer<UserSignupViewModel>(
        builder: (context, provider, child) => _UserSignupPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _UserSignupPage extends StatefulWidget {
  final UserSignupViewModel viewModel;

  const _UserSignupPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_UserSignupPage> createState() => _UserSignupPageState();
}

class _UserSignupPageState extends State<_UserSignupPage> {
  late final UserSignupViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: Padding(
          padding: const EdgeInsets.all(SizeTheme.paddingLargeSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogo(),
              const SizedBox(height: SizeTheme.paddingMiddleSize,),
              TitledTextFormField(
                labelText: "ID",
                hintText: "ID",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                validator: null,
                controller: _viewModel.idController,
              ),
              const SizedBox(height: SizeTheme.paddingMiddleSize,),
              TitledTextFormField(
                labelText: "비밀번호",
                hintText: "Password",
                prefixIcon: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                validator: null,
                controller: _viewModel.passwordController,
              ),
              const SizedBox(height: SizeTheme.paddingMiddleSize,),
              TitledTextFormField(
                labelText: "비밀번호 확인",
                hintText: "Check Password",
                prefixIcon: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                validator: null,
                controller: _viewModel.checkPasswordController,
              ),
              const SizedBox(height: SizeTheme.paddingMiddleSize,),
              CentralOutlinedButton(onPressed: () => _viewModel.signup(context), text: "회원가입"),
              const SizedBox(height: SizeTheme.paddingMiddleSize,),
              VanillaTextButton(onPressed: () => _viewModel.navigatePop(context), text: "이미 회원이신가요?"),
              const SizedBox(height: SizeTheme.paddingMiddleSize,),
              VanillaTextButton(onPressed: () => _viewModel.navigatePop(context), text: "버스 기사로 등록하고 싶으신가요?"),
            ],
          ),
        ),
      ),
    );
  }
}
