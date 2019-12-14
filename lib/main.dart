import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

import './routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  final Directory systemTempDir = Directory.systemTemp;
  final File tempFile = File('${systemTempDir.path}/image_database.imgdb');

  // create tempfile
  await tempFile.create();
  rootBundle.load("assets/image_database.imgdb").then((data) {
    tempFile.writeAsBytesSync(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));

    runApp(MyApp());
  }).catchError((error) {
    throw Exception(error);
  });
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  /// where the widgets starts building
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Food',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /// add more theming of the
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Routes.onGenerate,
      initialRoute: '/',
    );
  }
}