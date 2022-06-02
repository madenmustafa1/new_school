import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/app_util.dart';
import '../util/color_util.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppUtil.getWidth(context) / 1.5,
        height: AppUtil.getHeight(context) / 15,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(ColorUtil.BACKGROUND_COLOR),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppUtil.getWidth(context) / 5),
              ),
            ),
          ),
          onPressed: () => onPressed(),
          child: Text(
            buttonText,
            style: GoogleFonts.oswald(
              textStyle: TextStyle(
                fontSize: AppUtil.getHeight(context) / 30,
                fontWeight: FontWeight.bold,
                color: ColorUtil.MAIN_COLOR,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
