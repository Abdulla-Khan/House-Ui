import 'package:flutter/material.dart';
import 'package:house_ui/utils/constants.dart';

class BordarBox extends StatelessWidget {
  const BordarBox(
      {Key? key,
      required this.child,
      required this.padding,
      required this.width,
      required this.height})
      : super(key: key);
  final Widget child;
  final EdgeInsets padding;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
      ),
      padding: padding,
      child: Center(
        child: child,
      ),
    );
  }
}
