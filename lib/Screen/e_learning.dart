import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/Screen/constants.dart';

class ELearningPage extends StatefulWidget {
  @override
  _ELearningPageState createState() => _ELearningPageState();
}

class _ELearningPageState extends State<ELearningPage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(systemNavigationBarColor: kBackGroundColor),
      child: WebviewScaffold(
        url: 'https://e-learning.mtsn1malang.sch.id',
        ignoreSSLErrors: true,
        appCacheEnabled: true,
        geolocationEnabled: true,
        withZoom: true,
        allowFileURLs: true,
        hidden: true,
        withOverviewMode: true,
        appBar: AppBar(
            backgroundColor: kBackGroundColor,
            title: Text(
              "E-Learning MTs",
              style: GoogleFonts.fredokaOne(fontSize: kNativeAppBarFontSize),
            ),
            centerTitle: true,
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back,
              ),
              onTap: () async {
                await flutterWebviewPlugin.close();
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  child: Icon(Icons.refresh),
                  onTap: () {
                    final flutterWebViewPlugin = FlutterWebviewPlugin();
                    flutterWebViewPlugin.reload();
                  },
                ),
              ),
            ],
            brightness: Brightness.dark),
      ),
    );
  }
}
