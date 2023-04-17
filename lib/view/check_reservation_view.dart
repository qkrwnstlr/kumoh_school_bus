import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';
import 'package:kumoh_school_bus/view_model/check_reservation_view_model.dart';
import 'package:provider/provider.dart';

import '../theme/themes.dart';
import 'common/drawer_app_bar_scaffold.dart';

class CheckReservationView extends StatelessWidget {
  const CheckReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckReservationViewModel>(
      create: (_) => CheckReservationViewModel(),
      child: Consumer<CheckReservationViewModel>(
        builder: (context, provider, child) => _CheckReservationPage(
          viewModel: provider,
        ),
      ),
    );
  }
}

class _CheckReservationPage extends StatefulWidget {
  final CheckReservationViewModel viewModel;

  const _CheckReservationPage({Key? key, required this.viewModel})
      : super(key: key);

  @override
  State<_CheckReservationPage> createState() => _CheckReservationPageState();
}

class _CheckReservationPageState extends State<_CheckReservationPage> {
  late final CheckReservationViewModel _viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel.init();
    return DrawerAppBarScaffold(
      appBarTitle: 'Kumoh School Bus',
      body: ScrollableContainer(
        color: ColorTheme.backgroundMainColor,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: SizeTheme.paddingMiddleSize),
          itemCount: _viewModel.reservationList.length,
          itemBuilder: (BuildContext context, int index) =>
              _CheckReservationItem(
            reservationDTO: _viewModel.reservationList[index],
            onCancelButtonClick: _viewModel.onCancelButtonClick,
          ),
        ),
      ),
    );
  }
}

class _CheckReservationItem extends StatelessWidget {
  final ReservationDTO reservationDTO;
  final Future Function() onCancelButtonClick;

  const _CheckReservationItem({
    Key? key,
    required this.reservationDTO,
    required this.onCancelButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 3,
          child: TitledOutlinedContainer(
            title: "Kumoh School Bus",
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: SizeTheme.paddingLargeSize * 2),
                  child: AppLogo(),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: SizeTheme.paddingLargeSize * 2,
                      right: SizeTheme.paddingLargeSize * 2,
                      top: SizeTheme.paddingLargeSize,
                      bottom: SizeTheme.paddingLargeSize * 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitledText(title: "From.", text: reservationDTO.from),
                        TitledText(title: "From.", text: reservationDTO.to),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TitledText(
                                title: "By.",
                                text: reservationDTO.by,
                              ),
                            ),
                            const SizedBox(
                                width: SizeTheme.paddingLargeSize * 2),
                            Flexible(
                              flex: 1,
                              child: TitledText(
                                title: "When.",
                                text: reservationDTO.when,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: TitledOutlinedContainer(
            title: "",
            child: Column(
              children: [
                WrapOutlinedButton(
                  onPressed: () async {
                    await _showMyDialog(context);
                  },
                  text: '예약 취소',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '예약 취소',
            style: TextStyleTheme.textMainStyleMiddle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                onCancelButtonClick();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
