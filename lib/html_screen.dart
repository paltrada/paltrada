  //
  // import 'dart:io';
  // import 'package:flutter/material.dart';
  // import 'package:flutter/services.dart' show rootBundle;
  // import 'package:open_file/open_file.dart';
  // import 'package:path_provider/path_provider.dart';
  // import 'package:webview_flutter/webview_flutter.dart';
  // import 'constant/list_const.dart';
  //
  // class HtmlPage extends StatefulWidget {
  //   @override
  //   _HtmlPageState createState() => _HtmlPageState();
  // }
  //
  // class _HtmlPageState extends State<HtmlPage> {
  //   late WebViewController _webViewController;
  //   String _htmlContent = '';
  //
  //   @override
  //   void initState() {
  //     super.initState();
  //     _loadHtmlFromAssets();
  //   }
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       appBar: AppBar(
  //         title: Text('HTML Page'),
  //         actions: [
  //           IconButton(
  //             icon: Icon(Icons.file_download),
  //             onPressed: () async {
  //               await _downloadHtmlContent();
  //             },
  //           ),
  //         ],
  //       ),
  //       body: _htmlContent.isEmpty
  //           ? Center(child: CircularProgressIndicator())
  //           : WebView(
  //         initialUrl: Uri.dataFromString(_htmlContent, mimeType: 'text/html').toString(),
  //         onWebViewCreated: (controller) {
  //           _webViewController = controller;
  //         },
  //       ),
  //     );
  //   }
  //
  //   Future<void> _loadHtmlFromAssets() async {
  //     String htmlString = await rootBundle.loadString('assets/website/index.html');
  //     setState(() {
  //       _htmlContent = _replaceSkills(htmlString);
  //     });
  //   }
  //
  //   String _replaceSkills(String htmlString) {
  //     String userSkills = ListConst.skills;
  //     String userPinCode = ListConst.pinCode;
  //     htmlString = htmlString.replaceAll('Football, programming.', userSkills);
  //     htmlString = htmlString.replaceAll('111-222-3333', userPinCode);
  //     return htmlString;
  //   }
  //
  //   Future<void> _downloadHtmlContent() async {
  //     final directory = await getExternalStorageDirectory();
  //     final file = File('${directory!.path}/index.html');
  //     await file.writeAsString(_htmlContent);
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('HTML content downloaded successfully'),
  //         action: SnackBarAction(
  //           label: 'Open',
  //           onPressed: () {
  //             // Open the downloaded file
  //             OpenFile.open(file.path);
  //           },
  //         ),
  //       ),
  //     );
  //   }
  // }



  import 'dart:io';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart' show rootBundle;
  import 'package:open_file/open_file.dart';
  import 'package:path_provider/path_provider.dart';
  import 'package:webview_flutter/webview_flutter.dart';
  import 'constant/list_const.dart';

  class HtmlPage extends StatefulWidget {


    @override
    _HtmlPageState createState() => _HtmlPageState();
  }

  class _HtmlPageState extends State<HtmlPage> {
    late WebViewController _webViewController;
    String _htmlContent = '';

    @override
    void initState() {
      super.initState();
      _loadHtmlFromAssets();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('HTML Page'),
          actions: [
            IconButton(
              icon: Icon(Icons.file_download),
              onPressed: () async {
                await _downloadHtmlContent();
              },
            ),
          ],
        ),
        body: _htmlContent.isEmpty
            ? Center(child: CircularProgressIndicator())
            : WebView(
          initialUrl: Uri.dataFromString(_htmlContent, mimeType: 'text/html').toString(),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
        ),
      );
    }


    Future<void> _loadHtmlFromAssets() async {
      String htmlString = await rootBundle.loadString('assets/website/tem3.html');
      setState(() {
        _htmlContent = _replacePhoto(htmlString);
      });
    }

    String _replacePhoto(String htmlString) {
      String userPhotoUrl = ListConst.photoUrl; // Get the chosen image URL
      htmlString = htmlString.replaceAll('https://i.imgur.com/QKnl86e.jpg',(userPhotoUrl.isEmpty)?"https://i.imgur.com/QKnl86e.jpg" : userPhotoUrl); // Replace placeholder image URL with chosen image URL
      return htmlString;
    }



    Future<void> _downloadHtmlContent() async {
      final directory = await getExternalStorageDirectory();
      final file = File('${directory!.path}/index.html');
      await file.writeAsString(_htmlContent);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('HTML content downloaded successfully'),
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

