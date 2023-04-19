import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';
import 'package:kumoh_school_bus/view/common/scrollable_container.dart';
import 'package:kumoh_school_bus/view_model/driver_view_model.dart';
import 'package:provider/provider.dart';

class DriverView extends StatelessWidget {
  const DriverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DriverViewModel>(
      create: (_) => DriverViewModel(),
      child: Consumer<DriverViewModel>(
        builder: (context, provider, child) => _DriverPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _DriverPage extends StatefulWidget {
  final DriverViewModel viewModel;

  const _DriverPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<_DriverPage> {
  late final DriverViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return DrawerAppBarScaffold(
      appBarTitle: "Kumoh School Bus",
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: Container(),
      ),
    );
  }
}
