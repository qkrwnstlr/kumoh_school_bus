import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/type/types.dart';
import 'package:kumoh_school_bus/util/utils.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainViewModel>(
      create: (_) => MainViewModel(),
      child: Consumer<MainViewModel>(
        builder: (context, provider, child) => _MainPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _MainPage extends StatefulWidget {
  final MainViewModel viewModel;

  const _MainPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  late final MainViewModel _viewModel = widget.viewModel;

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
              OutlinedDropdownMenu(
                value: _viewModel.direction,
                items: Direction.values,
                onChanged: _viewModel.onDirectionChange,
              ),
              const SizedBox(height: SizeTheme.paddingMiddleSize),
              LeftSideOutlinedButton(
                onPressed: () => showDatePicker(
                  context: context,
                  initialDate: _viewModel.reservationDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 7)),
                ).then((value) => _viewModel.onReservationDateChanged(value)),
                text: dateDayFormat.format(_viewModel.reservationDate),
              ),
              const SizedBox(height: SizeTheme.paddingMiddleSize),
              SizedBox(
                height: 500,
                child: VanillaGoogleMap(
                  setOfMarkers: _viewModel.setOfMarkers,
                ),
              ),
              const SizedBox(height: SizeTheme.paddingMiddleSize),
              CentralOutlinedButton(
                onPressed: () => _viewModel.navigateToReservationPage(context),
                text: "조회 하기",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
