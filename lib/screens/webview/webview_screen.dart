import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../advertisement/constant.dart';
import '../../custom_widget/custom_button.dart';

class WebViewScreenRs26 extends StatefulWidget {
  const WebViewScreenRs26({super.key});

  @override
  State<WebViewScreenRs26> createState() => _WebViewScreenRs26State();
}

class _WebViewScreenRs26State extends State<WebViewScreenRs26> {

  void openInWebView() async {

    log("isOpenWebView ===>>> ${isOpenWebView}");
    if(isOpenWebView){
      log("isOpenWebView === ${isOpenWebView}");
      // const url = "https://www.sc.com/in/credit-cards/";
      if (await canLaunchUrl(Uri.parse(webViewUrl))) {
        await launchUrl(Uri.parse(webViewUrl), mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $webViewUrl';
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return (isOpenWebView)?CustomButton(onPressed: () {
      openInWebView();
    }, buttonText: "Apply Now"):SizedBox();
  }


}
