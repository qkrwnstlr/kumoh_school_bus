import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/navigation_drawer.dart';
import 'package:provider/provider.dart';

import 'central_app_bar.dart';

class DrawerAppBarScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;

  const DrawerAppBarScaffold({
    Key? key,
    required this.appBarTitle,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DrawerAppBarScaffoldController>(
      create: (_) => DrawerAppBarScaffoldController(),
      child: Scaffold(
        appBar: CentralAppBar.build(context, title: appBarTitle,
            leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: ColorTheme.itemSubColor,
                size: SizeTheme.iconMiddleSize,
              ));
        })),
        drawer: Consumer<DrawerAppBarScaffoldController>(
          builder: (context, controller, child) => NavigationDrawer(
            controller: NavigationDrawerController(
              context: context,
              memberName: controller.memberName,
              memberConnection: controller.memberConnection,
              items: controller.drawerItems,
            ),
          ),
        ),
        body: body,
      ),
    );
  }
}

class DrawerAppBarScaffoldController extends ChangeNotifier {
  late String memberName;
  late String memberConnection;

  late Map<String, Function(BuildContext)> drawerItems;

  DrawerAppBarScaffoldController._privateConstructor();

  static final DrawerAppBarScaffoldController _instance =
      DrawerAppBarScaffoldController._privateConstructor();

  factory DrawerAppBarScaffoldController() {
    return _instance;
  }

  void changeMemberInfo(String memberName, String memberConnection) {
    this.memberName = memberName;
    this.memberConnection = memberConnection;
    notifyListeners();
  }

  void changeDrawerItems(Map<String, Function(BuildContext)> drawerItems) {
    this.drawerItems = drawerItems;
    notifyListeners();
  }

  @override
  void dispose() {
    // don't make it dispose when DrawerAppBarScaffold is disposed
  }
}
