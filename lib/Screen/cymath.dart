import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class CymathPage extends StatefulWidget {
  @override
  _CymathPageState createState() => _CymathPageState();
}

class _CymathPageState extends State<CymathPage> {
  final webView = new FlutterWebviewPlugin();
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    webView.close();
  }

  @override
  void dispose() {
    super.dispose();
    webView.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebviewScaffold(
        url: 'https://www.cymath.com/',
        appCacheEnabled: true,
        geolocationEnabled: true,
        withZoom: true,
        allowFileURLs: true,
        hidden: true,
        withOverviewMode: true,
        appBar: AppBar(
          backgroundColor: kBackGroundColor,
          title: Text("Cymath", style: GoogleFonts.fredokaOne()),
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: () async {
              await webView.close();
              Get.back();
            },
          ),
          brightness: Brightness.dark,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBackGroundColor,
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Back"),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: "Refresh"),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward), label: "Forward"),
        ],
        selectedLabelStyle: GoogleFonts.sourceSansPro(
            fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.sourceSansPro(
            fontSize: 12, fontWeight: FontWeight.bold),
        currentIndex: _currentIndex,
        onTap: (_currentIndex) {
          if (_currentIndex == 0) {
            webView.goBack();
          } else if (_currentIndex == 1) {
            webView.reload();
          } else if (_currentIndex == 2) {
            webView.goForward();
          }
        },
      ),
    );
  }
}
