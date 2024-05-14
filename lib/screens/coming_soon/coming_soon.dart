import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../advertisement/google_ads.dart';
import '/advertisement/constant.dart';
import '/custom_widget/custom_scaffold.dart';

import '../../constant/img_const.dart';

class ComingSoonPageRs26 extends StatefulWidget {
  const ComingSoonPageRs26({Key? key}) : super(key: key);

  @override
  State<ComingSoonPageRs26> createState() => _ComingSoonPageRs26State();
}

class _ComingSoonPageRs26State extends State<ComingSoonPageRs26> {
  @override
  void initState() {
    getPreLoadAds();
    stopLoader();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return customScaffold(context: context,
        color: Colors.white,
        bgColor: Colors.white,
        children: [
      SizedBox(width:double.infinity,child: Lottie.asset(ImgConst.comingSoon,fit: BoxFit.fill))
    ]);
  }
  void stopLoader() async {
    if (isAllScreenAppOpenOn == true){
      log("Loader =======");
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => isOpenLoader.value = true);
      setState(() {

      });
    }


  }
}
