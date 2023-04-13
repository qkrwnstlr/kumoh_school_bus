import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/text_style_theme.dart';

class VanillaDropdownMenu<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final void Function(dynamic) onChanged;

  const VanillaDropdownMenu({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      items: items
          .map((e) => DropdownMenuItem(
              value: e,
              child: Text(e.toString(), style: TextStyleTheme.textMainStyleMiddle)))
          .toList(),
      onChanged: onChanged,
      underline: Container(),
      isExpanded: true,
    );
  }
}