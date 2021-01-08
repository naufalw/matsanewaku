import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/tools_menu.dart';

class ToolsMenuBrowser extends StatefulWidget {
  ToolsMenuBrowser({
    @required this.url,
    @required this.animType,
    @required this.title,
  });
  final String url;
  final animType;

  final String title;

  @override
  _ToolsMenuBrowserState createState() => _ToolsMenuBrowserState();
}

class _ToolsMenuBrowserState extends State<ToolsMenuBrowser> {
  final webView = new FlutterWebviewPlugin();
  StreamSubscription _onDestroy;

  @override
  void initState() {
    webView.close();
    super.initState();
    _onDestroy = webView.onDestroy.listen((_) {
      if (mounted) {
        setState(() {
          NavigatorTransitionsRoute(
              context: context,
              child: ToolsMenu(),
              animation: widget.animType,
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.transparent,
      ),
      child: WillPopScope(
        onWillPop: () async {
          webView.close();
          return true;
        },
        child: WebviewScaffold(
          url: widget.url,
          appCacheEnabled: true,
          geolocationEnabled: true,
          withZoom: true,
          allowFileURLs: true,
          hidden: true,
          withOverviewMode: true,
          appBar: AppBar(
            brightness: Brightness.dark,
            title: Text(widget.title, style: GoogleFonts.fredokaOne()),
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
                        webView.goBack();
                      },
                    ),
                    SizedBox(
                      width: width / 10,
                    ),
                    GestureDetector(
                      child: Icon(Icons.refresh),
                      onTap: () {
                        webView.reload();
                      },
                    ),
                    SizedBox(
                      width: width / 10,
                    ),
                    GestureDetector(
                      child: Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {
                        webView.goForward();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
