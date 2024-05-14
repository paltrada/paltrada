import 'package:flutter/material.dart';
import '../constant/color_const.dart';
import '/custom_widget/custom_text.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: title,
      color: ColorConst.titleText,
      ls: 1,
      weight: true,
      size: 22,
    );
  }
}
