import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_parser/youtube_parser.dart';

class YoutubePlayerPage extends StatefulWidget {
  final String url;
  final String title;
  YoutubePlayerPage(this.url, this.title);
  @override
  _YoutubePlayerPageState createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  String title;
  @override
  void initState() {
    String urlVid = widget.url;
    String idVid = getIdFromUrl(urlVid);
    super.initState();

    title = widget.title;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container());
  }
}
