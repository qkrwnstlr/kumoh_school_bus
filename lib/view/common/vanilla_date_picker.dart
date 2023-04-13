import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/themes.dart';

class VanillaDatePicker extends StatelessWidget {
  final void Function(DateTime) onDateTimeChanged;
  final String title;
  final DateTime initDate;
  final int overDate;

  const VanillaDatePicker({
    Key? key,
    required this.onDateTimeChanged,
    required this.initDate,
    required this.title,
    required this.overDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.backgroundSubColor,
        borderRadius: BorderRadius.circular(SizeTheme.borderRadiusSize),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  SizeTheme.paddingMiddleSize,
                  SizeTheme.paddingMiddleSize,
                  SizeTheme.paddingMiddleSize,
                  0.0,
                ),
                child: Icon(
                  Icons.date_range,
                  size: SizeTheme.iconMiddleSize,
                  color: ColorTheme.itemSubColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: SizeTheme.paddingMiddleSize),
                child: Text(
                  title,
                  style: TextStyleTheme.textMainStyleLarge,
                ),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: SizeTheme.outlinedButtonSize.height,
            ),
            color: ColorTheme.backgroundSubColor,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyleTheme.textMainStyleMiddle,
                ),
              ),
              child: CupertinoDatePicker(
                minimumYear: overDate == 0 ? 1900 : DateTime.now().year,
                maximumYear: DateTime.now().add(Duration(days: overDate)).year,
                initialDateTime: initDate,
                maximumDate: DateTime.now().add(Duration(days: overDate)),
                onDateTimeChanged: onDateTimeChanged,
                mode: CupertinoDatePickerMode.date,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
