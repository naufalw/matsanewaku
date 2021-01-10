import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/cymath.dart';
import 'package:school_app/Screen/main_menu.dart';
import 'package:school_app/Screen/settings_page.dart';
import 'package:school_app/Screen/calc_screen.dart';
import 'package:school_app/Screen/toolsMenuBrowser.dart';

class ToolsMenu extends StatefulWidget {
  @override
  _ToolsMenuState createState() => _ToolsMenuState();
}

class _ToolsMenuState extends State<ToolsMenu> {
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
                              NavigatorTransitionsRoute(
                                context: context,
                                child: MainMenuPage(),
                                animation: AnimationType.slideRightToLeft,
                                duration: Duration(milliseconds: 300),
                              );
                            });
                          },
                        ),
                        Text(
                          "Tools",
                          style: GoogleFonts.fredokaOne(
                            fontSize: kAppBarFontSize,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        GestureDetector(
                          child: Icon(
                            FontAwesomeIcons.cog,
                            color: Colors.white,
                            size: kAppBarIconSize,
                          ),
                          onTap: () {
                            setState(() {
                              NavigatorTransitionsRoute(
                                context: context,
                                child: SettingsPage(),
                                animation: AnimationType.fade,
                                duration: Duration(milliseconds: 300),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ToolsMenuCard(
                              width: width,
                              animType: AnimationType.slideLeftToRight,
                              text: "Calculator",
                              icon: FontAwesomeIcons.calculator,
                              navigateTo: CalcScreen(),
                            ),
                            ToolsMenuCardDualLine(
                              width: width,
                              icon: Icons.book_rounded,
                              navigateTo: ToolsMenuBrowser(
                                url:
                                    'https://www.oxfordlearnersdictionaries.com/',
                                animType: AnimationType.slideLeftToRight,
                                title: "Oxford Dict",
                              ),
                              textone: "Oxford",
                              texttwo: "Dict",
                              animType: AnimationType.slideRightToLeft,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(30),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ToolsMenuCard(
                                width: width,
                                animType: AnimationType.slideLeftToRight,
                                text: "Cymath",
                                icon: Icons.calculate,
                                navigateTo: CymathPage()),
                            ToolsMenuCard(
                              width: width,
                              animType: AnimationType.slideRightToLeft,
                              text: "Conjugator",
                              icon: Icons.book_sharp,
                              navigateTo: ToolsMenuBrowser(
                                  url: 'https://en.bab.la/conjugation/english/',
                                  animType: AnimationType.slideLeftToRight,
                                  title: "Conjugator"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(30),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ToolsMenuCard(
                              width: width,
                              animType: AnimationType.slideLeftToRight,
                              text: "Mathsisfun",
                              icon: Icons.calculate_outlined,
                              navigateTo: ToolsMenuBrowser(
                                  url: 'https://www.mathsisfun.com/',
                                  animType: AnimationType.slideLeftToRight,
                                  title: "Mathsisfun"),
                            ),
                            ToolsMenuCard(
                              width: width,
                              animType: AnimationType.slideRightToLeft,
                              text: "Conjugator",
                              icon: FontAwesomeIcons.book,
                              navigateTo: ToolsMenuBrowser(
                                  url: 'https://kbbi.kemdikbud.go.id/',
                                  animType: AnimationType.slideLeftToRight,
                                  title: "KBBI"),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class ToolsMenuCardDualLine extends StatelessWidget {
  const ToolsMenuCardDualLine({
    @required this.width,
    @required this.navigateTo,
    @required this.animType,
    @required this.icon,
    @required this.textone,
    @required this.texttwo,
  });

  final double width;
  final navigateTo;
  final animType;
  final icon;
  final String textone;
  final String texttwo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kToolsMenuButtonWidth,
      height: kToolsMenuButtonHeight,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        color: kSecondColor,
        elevation: 5,
        onPressed: () {
          NavigatorTransitionsRoute(
            context: context,
            child: navigateTo,
            animation: animType,
            duration: Duration(milliseconds: 300),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 60),
            Container(
              child: Column(
                children: [
                  Text(textone,
                      style: GoogleFonts.fredokaOne(
                          color: Colors.white, fontSize: 20)),
                  Text(texttwo,
                      style: GoogleFonts.fredokaOne(
                          color: Colors.white, fontSize: 20))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToolsMenuCard extends StatelessWidget {
  const ToolsMenuCard({
    @required this.width,
    @required this.navigateTo,
    @required this.animType,
    @required this.icon,
    @required this.text,
  });

  final double width;
  final navigateTo;
  final animType;
  final icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kToolsMenuButtonWidth,
      height: kToolsMenuButtonHeight,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        color: kSecondColor,
        elevation: 5,
        onPressed: () {
          NavigatorTransitionsRoute(
            context: context,
            child: navigateTo,
            animation: animType,
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
              size: 48,
            ),
            Text(
              text,
              style: GoogleFonts.fredokaOne(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
