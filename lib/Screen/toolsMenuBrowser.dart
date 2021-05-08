import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/Screen/constants.dart';

class ToolsMenuBrowser extends StatefulWidget {
  ToolsMenuBrowser({
    @required this.url,
    @required this.title,
  });
  final String url;

  final String title;

  @override
  _ToolsMenuBrowserState createState() => _ToolsMenuBrowserState();
}

class _ToolsMenuBrowserState extends State<ToolsMenuBrowser> {
  final webView = new FlutterWebviewPlugin();

  @override
  void initState() {
    webView.close();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    webView.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: kBackGroundColor,
      ),
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
          title: Text(widget.title,
              style: GoogleFonts.fredokaOne(fontSize: kNativeAppBarFontSize)),
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
    );
  }
}
