import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:prefs/prefs.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/e_learning.dart';
import 'package:school_app/Screen/newkeepnotescreen.dart';
import 'package:school_app/Screen/tools_menu.dart';
import 'package:flutter/services.dart';
import 'package:school_app/Screen/schedule_screen.dart';
import 'package:school_app/Screen/videoPlaylist_selector.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:school_app/backend/notif_brain.dart';
// ignore: unused_import

class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  bool notificationsAllowed = false;

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      setState(() {
        notificationsAllowed = isAllowed;
      });
      if (!isAllowed) {
        requestUserPermission(isAllowed);
      }
    });
    applySchedule(Prefs.getBool("notifStatus"));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void requestUserPermission(bool isAllowed) async {
    CoolAlert.show(
      type: CoolAlertType.confirm,
      context: context,
      text: "Mau Notif Mapel ?",
      confirmBtnText: "Ya",
      cancelBtnText: "Tidak",
      onCancelBtnTap: () async {
        Navigator.of(context).pop();
        notificationsAllowed =
            await AwesomeNotifications().isNotificationAllowed();
        setState(() {
          notificationsAllowed = notificationsAllowed;
        });
      },
      onConfirmBtnTap: () async {
        Navigator.of(context).pop();
        await AwesomeNotifications().requestPermissionToSendNotifications();
        notificationsAllowed =
            await AwesomeNotifications().isNotificationAllowed();
        setState(() {
          notificationsAllowed = notificationsAllowed;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(systemNavigationBarColor: Colors.transparent),
      child: WillPopScope(
        onWillPop: () async => CoolAlert.show(
          type: CoolAlertType.confirm,
          context: context,
          text: "Do You Want To Exit?",
          confirmBtnColor: kMainColor,
          confirmBtnText: "Yes",
          onConfirmBtnTap: () => SystemNavigator.pop(),
        ),
        child: Scaffold(
          backgroundColor: kBackGroundColor,
          body: Stack(children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: kBackGroundColor,
                        width: width,
                        height: ScreenUtil().setHeight(40),
                      ),
                      Container(
                        color: kBackGroundColor,
                        width: width,
                        height: ScreenUtil().setHeight(200),
                        child: Center(
                          child: Text(
                            "Halo Bro !",
                            style: GoogleFonts.fredokaOne(
                                fontSize: ScreenUtil().setSp(120),
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: ScreenUtil().setHeight(600),
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemBuilder: (_, index) {
                            return Column(
                              children: [
                                JadwalCard(width: width, height: height),
                                SizedBox(
                                  width: width,
                                  height: ScreenUtil().setHeight(30),
                                )
                              ],
                            );
                          },
                          itemCount: 5,
                          addRepaintBoundaries: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SlidingUpPanel(
              //parallaxEnabled: true,
              backdropEnabled: true,
              borderRadius: BorderRadius.circular(30),
              defaultPanelState: PanelState.CLOSED,
              maxHeight: 0.9 * height,
              minHeight: 0.57 * height,
              panel: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ReusableMainMenuCard(
                            text: "Zoom Vid",
                            icon: FontAwesomeIcons.video,
                            animation: AnimationType.slideLeftToRight,
                            goToScreen: VideoPlaylistSelector(),
                          ),
                          ReusableMainMenuCard(
                            text: "E-Learning",
                            icon: FontAwesomeIcons.school,
                            animation: AnimationType.slideRightToLeft,
                            goToScreen: ELearningPage(),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(60),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ReusableMainMenuCard(
                                text: "Tools",
                                icon: FontAwesomeIcons.toolbox,
                                animation: AnimationType.slideLeftToRight,
                                goToScreen: ToolsMenu(),
                              ),
                              ReusableMainMenuCard(
                                  goToScreen: ScheduleScreen(),
                                  animation: AnimationType.slideRightToLeft,
                                  text: "Schedule",
                                  icon: FontAwesomeIcons.solidClock)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(60),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UnusedCardWidgetMenu(
                                icon: FontAwesomeIcons.book,
                                text: "Books",
                              ),
                              ReusableMainMenuCard(
                                goToScreen: GoogleKeepNewPage(),
                                animation: AnimationType.slideRightToLeft,
                                text: "Notes",
                                icon: FontAwesomeIcons.solidStickyNote,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class JadwalCard extends StatelessWidget {
  const JadwalCard({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10, 0.0),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().setHeight(470),
        decoration: BoxDecoration(
            color: Color(0xFF3362CC), borderRadius: BorderRadius.circular(30)),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(200),
                      height: ScreenUtil().setWidth(200),
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Icon(
                        FontAwesomeIcons.book,
                        color: Colors.blue[100],
                        size: ScreenUtil().setSp(100),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(50),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(500),
                          child: Text('Null',
                              style: GoogleFonts.fredokaOne(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(100),
                              )),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(500),
                          child: Text(
                            'Null',
                            style: GoogleFonts.firaSans(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(50)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(15),
                      height: width * 0.01,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Zoom",
                            style: GoogleFonts.passionOne(
                                color: Color(0xFF9EB4E7),
                                fontSize: ScreenUtil().setSp(55),
                                fontWeight: FontWeight.w400),
                          ),
                          Text("Null",
                              style: GoogleFonts.fredokaOne(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(45),
                                  fontWeight: FontWeight.w100)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Pengajar",
                            style: GoogleFonts.passionOne(
                                color: Color(0xFF9EB4E7),
                                fontSize: ScreenUtil().setSp(55),
                                fontWeight: FontWeight.w400),
                          ),
                          Text("Null",
                              style: GoogleFonts.fredokaOne(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(45),
                                  fontWeight: FontWeight.w100))
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: height * 0.04,
                  width: width / 2.5,
                  child: Center(
                      child: Text("Null",
                          style: GoogleFonts.fredokaOne(
                            color: Colors.white,
                            fontSize: height * 0.025,
                          ))),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFF2A4EA2,
                      ),
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [BoxShadow()]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UnusedCardWidgetMenu extends StatelessWidget {
  final text;
  final icon;

  UnusedCardWidgetMenu({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(430),
      height: ScreenUtil().setHeight(360),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: kMainColor,
        elevation: 5,
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 48,
            ),
            Text(text,
                style:
                    GoogleFonts.fredokaOne(color: Colors.white, fontSize: 20))
          ],
        ),
      ),
    );
  }
}

class ReusableMainMenuCard extends StatelessWidget {
  final goToScreen;
  final animation;
  final text;
  final icon;

  ReusableMainMenuCard(
      {@required this.goToScreen,
      @required this.animation,
      @required this.text,
      @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(430),
      height: ScreenUtil().setHeight(360),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: kMainColor,
        elevation: 5,
        onPressed: () {
          NavigatorTransitionsRoute(
            context: context,
            child: goToScreen,
            animation: animation,
            replacement: false,
            duration: Duration(milliseconds: 300),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: ScreenUtil().setSp(140),
            ),
            Text(text,
                style: GoogleFonts.fredokaOne(
                    color: Colors.white, fontSize: ScreenUtil().setSp(55)))
          ],
        ),
      ),
    );
  }
}
