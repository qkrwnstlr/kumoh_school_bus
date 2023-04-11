import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
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
  late final LoginViewModel _loginViewModel = widget.viewModel;

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
              TitledTextFormField(
                labelText: "labelText",
                hintText: "hintText",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                validator: null,
                controller: _loginViewModel.idController,
              ),
              TitledTextFormField(
                labelText: "labelText",
                hintText: "hintText",
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                validator: null,
                controller: _loginViewModel.passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
