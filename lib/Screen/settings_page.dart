import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:prefs/prefs.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/tools_menu.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        NavigatorTransitionsRoute(
          context: context,
          child: ToolsMenu(),
          animation: AnimationType.fade,
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
                              child: ToolsMenu(),
                              animation: AnimationType.fade,
                              duration: Duration(milliseconds: 300),
                            );
                          });
                        },
                      ),
                      Text(
                        "Settings",
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
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "ZoomVid Autoplay",
                          style: GoogleFonts.firaSans(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(90),
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(160),
                          child: Switch(
                            activeColor: kSecondColor,
                            activeTrackColor: Colors.purple[90],
                            inactiveTrackColor: Colors.grey,
                            value: Prefs.getBool("autoplayState", true),
                            onChanged: (state) {
                              Prefs.setBool("autoplayState", state);
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
