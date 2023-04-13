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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15, vertical: MediaQuery.of(context).size.width * 0.05),
            child: child,
          ),
        ),
      ),
    );
  }
}
