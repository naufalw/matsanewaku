import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/main_menu.dart';

class GoogleKeepNewPage extends StatefulWidget {
  @override
  _GoogleKeepNewPageState createState() => _GoogleKeepNewPageState();
}

class _GoogleKeepNewPageState extends State<GoogleKeepNewPage> {
  final webView = new FlutterWebviewPlugin();
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
              animation: AnimationType.slideLeftToRight,
              duration: Duration(milliseconds: 300),
              replacement: true);
        });
        return true;
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
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        await webView.close();
        return true;
      },
      child: WebviewScaffold(
        url: 'https://keep.google.com/',
        appCacheEnabled: true,
        geolocationEnabled: true,
        withZoom: true,
        allowFileURLs: true,
        hidden: true,
        useWideViewPort: true,
        appBar: AppBar(
          title: Text("Google Keep", style: GoogleFonts.fredokaOne()),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: () async {
              await webView.close();
              Navigator.pop(context);
              return true;
            },
          ),
          backgroundColor: kBackGroundColor,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back_ios_outlined),
                    onTap: () {
                      setState(() {
                        webView.goBack();
                      });
                    },
                  ),
                  SizedBox(
                    width: width / 10,
                  ),
                  GestureDetector(
                    child: Icon(Icons.refresh),
                    onTap: () {
                      setState(() {
                        webView.reload();
                      });
                    },
                  ),
                  SizedBox(
                    width: width / 10,
                  ),
                  GestureDetector(
                    child: Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () {
                      setState(() {
                        webView.goForward();
                      });
                    },
                  ),
                ],
              ),
            )
          ],
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
