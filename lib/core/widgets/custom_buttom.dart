import 'package:booklyapp/core/utils/Styles.dart';
import 'package:flutter/material.dart';

class customButtom extends StatelessWidget {
  const customButtom({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.colortext,
    required this.borderRadius,
    this.onPressed,
  });
  final String text;
  final Color backgroundColor;
  final Color colortext;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: borderRadius),
              ),
              backgroundColor: MaterialStateProperty.all(backgroundColor)),
          child: Text(
            text,
            style: Styles.textstyle18.copyWith(
              color: colortext,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
