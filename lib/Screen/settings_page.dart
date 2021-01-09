import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/tools_menu.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
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
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
