
import 'package:flutter/services.dart';
import '../constant/color_const.dart';
import '/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

import 'custom_scaffold.dart';

class CustomTextFormField1 extends StatelessWidget {
  const CustomTextFormField1({Key? key,required this.text,required this.controller,required this.hintText, this.length}) : super(key: key);
  final TextEditingController controller;
  final String text;
  final String hintText;
  final int? length;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSize(),
          CustomText(text: text, weight: false,size: 16,),
          const SizedBox(height: 8,),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: controller,
            maxLength: length,
            cursorColor: ColorConst.white,
            validator: (value){
              if(value!.isEmpty){
                return "Enter valid input!!";
              }
              return null;
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: ColorConst.buttonColor,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}
