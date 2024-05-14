import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'constant/list_const.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    _loadHtmlFromAssets();

    super.initState();
  }
  String _htmlContent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: () async {
              await _downloadHtmlContent();
            },
          ),

        ],
      ),
      body: _htmlContent.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          child: WebView(
            initialUrl: Uri.dataFromString(_htmlContent, mimeType: 'text/html').toString(),
            onWebViewCreated: (controller) {
            },
          ),
        ),
      ),
    );
  }



  Future<void> _loadHtmlFromAssets() async {
    String htmlString = await rootBundle.loadString("assets/website/tem2.html");
    htmlString = _replaceSkills(htmlString);
    htmlString = _replaceImage(htmlString, ListConst.photoUrl);
    setState(() {
      _htmlContent = htmlString;
    });
  }

  String _replaceSkills(String htmlString) {
    String userSkills = ListConst.skills;
    String userPinCode = ListConst.pinCode;
    htmlString = htmlString.replaceAll('Football, programming.', userSkills);
    htmlString = htmlString.replaceAll('111-222-3333', userPinCode);
    return htmlString;
  }



  String _replaceImage(String htmlString, String? imageUrl) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      htmlString = htmlString.replaceAll(
        'https://i.imgur.com/QKnl86e.jpg',
        imageUrl,
      );
    }
    return htmlString;
  }
  Future<void> _downloadHtmlContent() async {
    final directory = await getExternalStorageDirectory();
    final file = File('${directory!.path}/index.html');
    await file.writeAsString(_htmlContent);
    log("PAth >>>>>>> $file");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Your resume downloaded successfully'),
        action: SnackBarAction(
          label: 'Open',
          onPressed: () {
            // Open the downloaded file
            OpenFile.open(file.path);
          },
        ),
      ),
    );
  }

}


