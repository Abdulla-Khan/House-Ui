import 'package:flutter/material.dart';
import 'package:house_ui/utils/constants.dart';
import 'package:house_ui/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  const OptionButton(
      {Key? key, required this.text, required this.icon, required this.width})
      : super(key: key);
  final String text;
  final IconData icon;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: MaterialButton(
        splashColor: COLOR_WHITE.withAlpha(55),
        minWidth: width,
        color: COLOR_DARK_BLUE,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: COLOR_WHITE,
            ),
            addHorizontalSpace(10),
            Text(
              text,
              style: TextStyle(color: COLOR_WHITE),
            )
          ],
        ),
      ),
    );
  }
}
