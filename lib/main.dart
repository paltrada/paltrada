
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '/routing/page_routing.dart';
import '/routing/routes.dart';
import 'package:flutter/material.dart';

import 'constant/color_const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  FacebookAudienceNetwork.init();
  runApp(const MyAppH46());
}

class MyAppH46 extends StatelessWidget {
  const MyAppH46({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRouting().pageRouting,
      initialRoute: Routes.splash,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              elevation: 0,
              backgroundColor: ColorConst.appBarBg,
              iconTheme: const IconThemeData(color: ColorConst.appBarText)
          )
      ),
    );
  }
}
