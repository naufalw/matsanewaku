import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/Screen/constants.dart';

class GoogleKeepNewPage extends StatefulWidget {
  @override
  _GoogleKeepNewPageState createState() => _GoogleKeepNewPageState();
}

class _GoogleKeepNewPageState extends State<GoogleKeepNewPage> {
  final webView = new FlutterWebviewPlugin();
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
    double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(systemNavigationBarColor: kBackGroundColor),
      child: WebviewScaffold(
        url: 'https://keep.google.com/',
        appCacheEnabled: true,
        geolocationEnabled: true,
        withZoom: true,
        allowFileURLs: true,
        hidden: true,
        withOverviewMode: true,
        appBar: AppBar(
          title: Text("Google Keep", style: GoogleFonts.fredokaOne()),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: () {
              Get.back();
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
