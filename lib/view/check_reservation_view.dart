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
      create: (_) => CheckReservationViewModel(reservationList: [
        ReservationDTO(id: 1, from: "from", to: "to", by: "by", when: "when"),
        ReservationDTO(id: 1, from: "from", to: "to", by: "by", when: "when"),
      ]),
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
          ),
        ),
      ),
    );
  }
}

class _CheckReservationItem extends StatelessWidget {
  final ReservationDTO reservationDTO;

  const _CheckReservationItem({
    Key? key,
    required this.reservationDTO,
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
                  onPressed: () {},
                  text: '예약 취소',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
