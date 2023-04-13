import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';

import '../../theme/themes.dart';

class OutlinedDropdownMenu<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final void Function(dynamic) onChanged;

  const OutlinedDropdownMenu({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.backgroundSubColor,
        borderRadius: BorderRadius.circular(SizeTheme.borderRadiusSize),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SizeTheme.paddingMiddleSize,
          horizontal: SizeTheme.paddingLargeSize,
        ),
        child: VanillaDropdownMenu(
          value: value,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
