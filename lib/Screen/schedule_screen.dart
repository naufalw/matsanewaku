import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:prefs/prefs.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/main_menu.dart';
import 'package:school_app/backend/notif_brain.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List kelas = [
    "8L",
    "9D",
    "9F",
    "9J",
    "9L",
  ];
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: kBackGroundColor,
        statusBarBrightness: Brightness.dark));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light
          .copyWith(systemNavigationBarColor: kBackGroundColor),
      child: WillPopScope(
        onWillPop: () async {
          NavigatorTransitionsRoute(
            context: context,
            child: MainMenuPage(),
            animation: AnimationType.slideLeftToRight,
            duration: Duration(milliseconds: 300),
          );
          return true;
        },
        child: Scaffold(
          backgroundColor: kBackGroundColor,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: height * 0.1,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: width / 10,
                        ),
                        onTap: () {
                          setState(() {
                            NavigatorTransitionsRoute(
                              context: context,
                              child: MainMenuPage(),
                              animation: AnimationType.slideLeftToRight,
                              duration: Duration(milliseconds: 300),
                            );
                          });
                        },
                      ),
                      Text(
                        "Schedule",
                        style: GoogleFonts.fredokaOne(
                          fontSize: 50,
                          letterSpacing: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
                Container(
                  height: height / 20,
                  width: width,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Notifications",
                              style: GoogleFonts.firaSans(
                                  color: Colors.white,
                                  fontSize: height * 0.04,
                                  fontWeight: FontWeight.w500),
                            ),
                            DropdownButton(
                              iconDisabledColor: Colors.white,
                              iconEnabledColor: Colors.white,
                              dropdownColor: kMainColor,
                              style: GoogleFonts.firaSans(
                                color: Colors.white,
                                fontSize: height * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                              hint: Text(
                                Prefs.getString("kelasNotif", kelas[0]),
                                style: GoogleFonts.firaSans(
                                  color: Colors.white,
                                  fontSize: height * 0.04,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              value: Prefs.getString("kelasNotif", kelas[0]),
                              items: kelas.map((e) {
                                return DropdownMenuItem(
                                  child: Center(child: Text(e)),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (value) async {
                                await Prefs.setString("kelasNotif", value);
                                setState(() {
                                  applySchedule(Prefs.getBool("notifStatus"));
                                });
                              },
                            ),
                            Container(
                              width: width / 6,
                              child: Switch(
                                activeColor: kSecondColor,
                                activeTrackColor: Colors.purple[90],
                                inactiveTrackColor: Colors.grey,
                                value: Prefs.getBool("notifStatus", false),
                                onChanged: (state) async {
                                  Prefs.setBool("notifStatus", state);
                                  setState(() {
                                    applySchedule(state);
                                    if (state == true) {
                                      AwesomeNotifications().createNotification(
                                          content: NotificationContent(
                                              id: Random().nextInt(10000),
                                              channelKey: 'progress_channel',
                                              title: 'Information',
                                              body:
                                                  'Notification Service is Running'));
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
