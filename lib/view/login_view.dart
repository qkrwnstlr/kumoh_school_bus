import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/app_logo.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:provider/provider.dart';

import '../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, provider, child) => LoginPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginViewModel _viewModel = widget.viewModel;

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
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                validator: null,
                controller: _viewModel.passwordController,
              ),
              const SizedBox(height: SizeTheme.paddingMiddleSize,),
              CentralOutlinedButton(onPressed: _viewModel.login, text: "로그인"),
              const SizedBox(height: SizeTheme.paddingMiddleSize,),
              VanillaTextButton(onPressed: _viewModel.navigateToUserSignupPage, text: "회원이 아니신가요?"),
            ],
          ),
        ),
      ),
    );
  }
}
