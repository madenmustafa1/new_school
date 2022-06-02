import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/app_util.dart';
import '../util/color_util.dart';

// ignore: must_be_immutable
class SimpleText extends StatelessWidget {
  final String text;
  final double? optionalTextSize;
  final Color? textColor;

  SimpleText({
    Key? key,
    required this.text,
    this.optionalTextSize,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    defaultTextConfig(context);

    return Text(
      text,
      style: GoogleFonts.oswald(
        textStyle: TextStyle(
          fontSize: optionalTextSize ?? textSize,
          fontWeight: FontWeight.bold,
          color: textColor ?? ColorUtil.DEFAULT_TEXT_COLOR,
        ),
      ),
    );
  }

  //Default
  double textSize = 16;

  void defaultTextConfig(BuildContext context) {
    textSize = AppUtil.getHeight(context) / 18;
  }
}
