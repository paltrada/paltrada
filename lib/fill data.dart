import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'constant/list_const.dart';
import 'custom/custom_size.dart';
import 'custom/custom_text.dart';
import 'custom/custom_text_form_field.dart';
import 'onlyopnehtml.dart';
import 'html_screen.dart';

class FillDataScreen extends StatefulWidget {
  const FillDataScreen({super.key});

  @override
  State<FillDataScreen> createState() => _FillDataScreenState();
}

class _FillDataScreenState extends State<FillDataScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  Uint8List? imageData; // Store the image data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fill Data 1"),actions: [
        IconButton(onPressed: ()async {
          final imagePicker = ImagePicker();
          final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            setState(() {
              ListConst.photoUrl = pickedFile.path; // Store the path of the selected image
              log("ListConst.photoUrl ????? ${ListConst.photoUrl}");
            });
          }
        }, icon: Icon(Icons.photo)),
        IconButton(
          onPressed: () async {
            final imagePicker = ImagePicker();
            final pickedFile =
            await imagePicker.getImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              final bytes = await pickedFile.readAsBytes();
              final imageData = bytes.buffer.asUint8List();
              final base64Image = base64Encode(imageData);
              setState(() {
                ListConst.photoUrl = "data:image/jpeg;base64,$base64Image";
                this.imageData = imageData; // Store the image data
                log("ListConst.photoUrl >>>> ${ListConst.photoUrl}");
                log("this.imageData ????? ${this.imageData}");
                log("imageData ??? $imageData");
              });
            }
          },
          icon: Icon(Icons.camera),
        )
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getField(),
            getButton(),
            if (ListConst.photoUrl.isNotEmpty) ...[
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File(ListConst.photoUrl)),
              ),
              if (imageData != null) ...[
                const SizedBox(height: 20),
                Image.memory(imageData!), // Display the selected image
              ],
            ],
          ],

        ),
      ),
    );
  }

  Widget getField(){
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const CustomSize(height: 30,),
          const CustomText(
            text: "Address",
            size: 35,
            weight: true,
            color: Colors.black,
            align: TextAlign.start,
          ),
          const CustomSize(
            height: 14,
          ),
          const CustomText(
            text: "Provide your address",
            color: Colors.black,
            size: 16,
          ),
          const CustomSize(height: 30,),

          const CustomSize(),
          CustomTextFormField(hintText: "Pin Code",
              icon: Icons.pin,
              keyboardType: TextInputType.number,
              controller: pinCodeController),
          const CustomSize(),
          CustomTextFormField(hintText: "Skills",
              icon: Icons.description,
              controller: skillsController),
          const CustomSize(height: 10,)
        ],
      ),
    );
  }

  Widget getButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child:
      ElevatedButton(onPressed: () {
        if (formKey.currentState!.validate()) {

          ListConst.skills = skillsController.text;
          ListConst.pinCode = pinCodeController.text;
         // Navigator.push(context, MaterialPageRoute(builder: (context) => HtmlPage(photoUrl: ListConst.photoUrl),));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HtmlPage()),
          );
        }
      }, child: Text("Save & Continue"))
    );
  }
}

