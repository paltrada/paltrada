/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OPEN HTML"),),
      body: WebViewPlus(


        onWebViewCreated: (controller) {
          controller.loadUrl("assets/website/index.html");
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}




*/



import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../constant/list_const.dart';
import 'package:pdf/widgets.dart' as pw; // Import pw namespace

class OpenResume1Screen extends StatefulWidget {
  const OpenResume1Screen({super.key});

  @override
  State<OpenResume1Screen> createState() => _OpenResume1ScreenState();
}

class _OpenResume1ScreenState extends State<OpenResume1Screen> {
  @override
  void initState() {
    _loadHtmlFromAssets();

    super.initState();
  }

  final screenshotController = ScreenshotController();
  late WebViewController _webViewController;
  String _htmlContent = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Resume 12"),
      actions: [
        IconButton(onPressed: () async{
                  log("OPEN");
                  Uint8List? imageBytes = await screenshotController.capture();
                  if (imageBytes != null) {
                    final pdf = pw.Document();
                    pdf.addPage(
                      pw.Page(
                        build: (pw.Context context) {
                          return pw.Image(
                            pw.MemoryImage(imageBytes),
                            fit: pw.BoxFit.contain,
                          );
                        },
                      ),
                    );

                    final output = await getExternalStorageDirectory();
                    final file = File('${output!.path}/resume.pdf');
                    await file.writeAsBytes(await pdf.save());
                    OpenFile.open(file.path);
                  }
                  log("OPEN12");
        }, icon: Icon(Icons.download))
      ],
      ),
      body:         _htmlContent.isEmpty
                 ? Center(child: CircularProgressIndicator())
                : GetResume(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // generateExampleDocument();
            log("OPEN");
            Uint8List? imageBytes = await screenshotController.capture();
            if (imageBytes != null) {
              final pdf = pw.Document();
              pdf.addPage(
                pw.Page(
                  build: (pw.Context context) {
                    return pw.Image(
                      pw.MemoryImage(imageBytes),
                      fit: pw.BoxFit.contain,
                    );
                  },
                ),
              );

              final output = await getExternalStorageDirectory();
              final file = File('${output!.path}/resume.pdf');
              await file.writeAsBytes(await pdf.save());
              OpenFile.open(file.path);
            }
          },
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.download,
            color: Colors.white,
            size: 28,
          ),
        )
    );
  }

  Future<void> generatePdf() async {
    try {
      Uint8List? imageBytes = await screenshotController.capture();
      if (imageBytes != null) {
        final pdf = pw.Document();
        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Image(
                pw.MemoryImage(imageBytes),
                fit: pw.BoxFit.contain,
              );
            },
          ),
        );

        final output = await getExternalStorageDirectory();
        final file = File('${output!.path}/resume.pdf');
        await file.writeAsBytes(await pdf.save());
        OpenFile.open(file.path);
      } else {
        print("Failed to capture screenshot");
      }
    } catch (e) {
      print("Error generating PDF: $e");
    }
  }

  Future<void> _loadHtmlFromAssets() async {
    String htmlString = await rootBundle.loadString("assets/website/index.html");
    setState(() {
      _htmlContent = _replaceSkills(htmlString);
    });
  }

  String _replaceSkills(String htmlString) {
    String userSkills = ListConst.skills;
    String userPinCode = ListConst.pinCode;
    htmlString = htmlString.replaceAll('Football, programming.', userSkills);
    htmlString = htmlString.replaceAll('111-222-3333', userPinCode);
    return htmlString;

  }

  Widget GetResume() {
    return  WebView(
      initialUrl: Uri.dataFromString(_htmlContent, mimeType: 'text/html').toString(),
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
    );
  }


}

