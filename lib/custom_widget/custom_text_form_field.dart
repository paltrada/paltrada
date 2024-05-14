import 'package:flutter/material.dart';
import '../constant/color_const.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.keyboardType});

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConst.textFormFieldColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100, spreadRadius: 2, blurRadius: 5)
          ]
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: TextFormField(
            keyboardType:keyboardType,
            controller: controller,
            style: const TextStyle(fontFamily: "gil"),
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                label: CustomText(text: hintText),
                fillColor: ColorConst.textFormFieldColor,
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConst.bgColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(icon, color: ColorConst.black,),
                    ),
                  ),
                ),

                hintText: hintText,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontFamily: "gil"),
                filled: true
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter valid input";
              }
              return null;
            },
          )),
    );
  }
}
