import 'package:flutter/material.dart';

class ScrollableContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  const ScrollableContainer(
      {Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: color,
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: child,
        ),
      ),
    );
  }
}
