import 'dart:developer';
import 'package:open_app_file/open_app_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


Future<void> saveAndLaunchFile(List<int> bytes, String fileName)async{
  final path = (await getExternalStorageDirectory())!.path;
  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes,flush: true);
  OpenAppFile.open('$path/$fileName');
  OpenAppFile.open('$path/$fileName', mimeType: 'text/plain', uti: 'public.plain-text');

  log("Create PDF");
}



