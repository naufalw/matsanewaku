import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:school_app/Screen/main_menu.dart';

import 'constants.dart';

class CymathPage extends StatefulWidget {
  @override
  _CymathPageState createState() => _CymathPageState();
}

class _CymathPageState extends State<CymathPage> {
  final webView = new FlutterWebviewPlugin();
  int _currentIndex = 1;
  StreamSubscription _onDestroy;
  @override
  void initState() {
    super.initState();
    webView.close();
    _onDestroy = webView.onDestroy.listen((_) {
      if (mounted) {
        setState(() {
          NavigatorTransitionsRoute(
              context: context,
              child: MainMenuPage(),
              animation: AnimationType.slideRightToLeft,
              duration: Duration(milliseconds: 300),
              replacement: true);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onDestroy.cancel();
    webView.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        webView.close();
        return true;
      },
      child: Scaffold(
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
                Navigator.pop(context);
              },
            ),
            brightness: Brightness.dark,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back), label: "Back"),
            BottomNavigationBarItem(
                icon: Icon(Icons.refresh), label: "Refresh"),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_forward), label: "Forward"),
          ],
          selectedLabelStyle: GoogleFonts.sourceSansPro(
              fontSize: 12, fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.sourceSansPro(
              fontSize: 12, fontWeight: FontWeight.bold),
          currentIndex: _currentIndex,
          fixedColor: Colors.black54,
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
      ),
    );
  }
}
