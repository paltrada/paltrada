

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key,this.color,this.align,this.size, required this.text,this.weight, this.ls, this.overflow,this.maxLines,this.fontFamily}) : super(key: key);
  final String text;
  final bool? weight;
  final double? size;
  final Color? color;
  final TextAlign? align;
  final double? ls;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,textAlign: align ?? TextAlign.center,style: TextStyle(
      fontSize: size ?? 14,
      color: color ?? Colors.black,
      fontWeight: weight ?? false ? FontWeight.bold : FontWeight.normal,
      overflow: overflow ?? TextOverflow.fade,
      letterSpacing: ls ?? 0,
      fontFamily: fontFamily,
    ),
      maxLines: maxLines,
    );
  }
}