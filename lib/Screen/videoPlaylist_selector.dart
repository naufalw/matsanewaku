import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/main_menu.dart';
import 'package:school_app/Screen/player.dart';
import 'constants.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoPlaylistSelector extends StatefulWidget {
  @override
  _VideoPlaylistSelectorState createState() => _VideoPlaylistSelectorState();
}

class _VideoPlaylistSelectorState extends State<VideoPlaylistSelector> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(systemNavigationBarColor: kBackGroundColor),
      child: WillPopScope(
        onWillPop: () async {
          NavigatorTransitionsRoute(
            context: context,
            child: MainMenuPage(),
            animation: AnimationType.slideRightToLeft,
            duration: Duration(milliseconds: 300),
          );
          return true;
        },
        child: Scaffold(
          backgroundColor: kBackGroundColor,
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      height: kAppBarTopMargin,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: kAppBarIconSize,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              NavigatorTransitionsRoute(
                                context: context,
                                child: MainMenuPage(),
                                animation: AnimationType.slideRightToLeft,
                                duration: Duration(milliseconds: 300),
                                replacement: true,
                              );
                            });
                          },
                        ),
                        Text(
                          "Zoom Vid",
                          style: GoogleFonts.fredokaOne(
                            fontSize: kAppBarFontSize,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(),
                        SizedBox()
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    ZoomCard('PL6wJWURYUK0I2b_KLTislSlvfRh1yfhGy', "9L Ganjil"),
                    ZoomCard("PL6wJWURYUK0JYTOyeD-m6mWgn7G0zdaTB", "9L Genap")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ZoomCard extends StatelessWidget {
  final String namaKelas, playlistID;
  const ZoomCard(this.playlistID, this.namaKelas);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().setHeight(120),
        child: RaisedButton(
          onPressed: () {
            NavigatorTransitionsRoute(
                context: context, child: VideoPlaylist(playlistID, namaKelas));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(24),
            ),
          ),
          color: kMainColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                namaKelas,
                style: GoogleFonts.fredokaOne(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(75),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: ScreenUtil().setSp(60),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlaylist extends StatefulWidget {
  final String playlistID;
  final String classTitle;
  VideoPlaylist(this.playlistID, this.classTitle);
  @override
  _VideoPlaylistState createState() => _VideoPlaylistState();
}

class _VideoPlaylistState extends State<VideoPlaylist> {
  String playlistID, classTitle;
  var dataVid = [];
  var yt = YoutubeExplode();
  Future<void> getItemsList(String plID) async {
    var playlist = await yt.playlists.get(plID);
    await for (var video in yt.playlists.getVideos(playlist.id)) {
      var videoTitle = video.title;
      var videoThumb = video.thumbnails.highResUrl;
      var videoUrl = video.url;
      var templateMap = {
        'title': videoTitle.toString(),
        'thumb': videoThumb.toString(),
        'url': videoUrl.toString()
      };
      dataVid.add(templateMap);
    }
    setState(() {});
  }

  void initState() {
    classTitle = widget.classTitle;
    playlistID = widget.playlistID;
    super.initState();
    getItemsList(playlistID);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light
          .copyWith(systemNavigationBarColor: kBackGroundColor),
      child: Scaffold(
          backgroundColor: kBackGroundColor,
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      width: ScreenUtil().screenWidth,
                      height: kAppBarTopMargin,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: kAppBarIconSize,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                        ),
                        Text(
                          classTitle,
                          style: GoogleFonts.fredokaOne(
                            fontSize: kAppBarFontSize,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(),
                        SizedBox()
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Scrollbar(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 16),
                      addRepaintBoundaries: false,
                      itemCount: dataVid.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: FeaturedVidCard(
                              thumbnailURL: dataVid[index]['thumb'],
                              title: dataVid[index]['title'],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => YoutubePlayerPage(
                                          dataVid[index]['url'],
                                          dataVid[index]['title'])),
                                );
                              },
                            ));
                      }),
                ),
              )
            ],
          )),
    );
  }
}
