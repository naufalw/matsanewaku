import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prefs/prefs.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/settings_page.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_parser/youtube_parser.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatefulWidget {
  final String url;
  final String title;
  YoutubePlayerPage(this.url, this.title);
  @override
  _YoutubePlayerPageState createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  YoutubePlayerController _controller;
  String urlVid, title, idVid;

  @override
  void initState() {
    urlVid = widget.url;
    idVid = getIdFromUrl(urlVid);
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: idVid,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        autoPlay: Prefs.getBool("autoplayState", true),
        forceHD: true,
        disableDragSeek: true,
      ),
    );
    title = widget.title;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        showVideoProgressIndicator: true,
        controller: _controller,
        aspectRatio: 16 / 9,
        progressColors: ProgressBarColors(
          backgroundColor: kSecondColor,
          playedColor: kMainColor,
        ),
      ),
      builder: (context, player) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle.light.copyWith(
            systemNavigationBarColor: kBackGroundColor,
          ),
          child: Scaffold(
            backgroundColor: kBackGroundColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Video Player",
                style: GoogleFonts.firaSans(fontWeight: FontWeight.w500),
              ),
              backgroundColor: kBackGroundColor,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Tooltip(
                    message: "Settings",
                    child: InkWell(
                      onTap: () => Get.to(() => SettingsPage()),
                      child: Icon(Icons.settings),
                    ),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                player,
                SizedBox(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setSp(50),
                ),
                Text(
                  title,
                  style: GoogleFonts.firaSans(
                      fontSize: ScreenUtil().setSp(58),
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(95),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              ScreenUtil().setWidth(24),
                            ),
                          ),
                          primary: kMainColor),
                      onPressed: () async {
                        _controller.pause();
                        String url = 'https://www.youtubepp.com/watch?v=$idVid';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              confirmBtnColor: kMainColor);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Download",
                            style: GoogleFonts.fredokaOne(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(65),
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.download,
                            color: Colors.white,
                            size: ScreenUtil().setSp(50),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(95),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(24),
                          ),
                        ),
                        primary: kMainColor,
                      ),
                      onPressed: () async {
                        _controller.pause();
                        Share.share(urlVid);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Share",
                            style: GoogleFonts.fredokaOne(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(65),
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.share,
                            color: Colors.white,
                            size: ScreenUtil().setSp(50),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
