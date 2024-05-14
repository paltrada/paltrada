import 'package:flutter/material.dart';

class CustomSize extends StatelessWidget {
  const CustomSize({super.key,this.height,this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 10,
      width: width ?? 10,
    );
  }
}
