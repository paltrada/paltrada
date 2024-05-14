import '../constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.weight,
      this.textSize
      })
      : super(key: key);
  final VoidCallback onPressed;
  final String buttonText;
  final bool? weight;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
            backgroundColor: ColorConst.buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomText(
            size: textSize ?? 16,
            text: buttonText,
            weight: weight ?? true,
            color: Colors.white,
          ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
        ));
  }
}