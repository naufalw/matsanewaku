import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/Screen/constants.dart';
import 'package:school_app/Screen/cymath.dart';
import 'package:school_app/Screen/settings_page.dart';
import 'package:school_app/Screen/toolsMenuBrowser.dart';

class ToolsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
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
                          onTap: () => Get.back()),
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
                          onTap: () => Get.to(() => SettingsPage())),
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
                            text: "KBBI",
                            icon: FontAwesomeIcons.book,
                            onPressed: () => Get.to(
                              () => ToolsMenuBrowser(
                                  url: 'https://kbbi.kemdikbud.go.id/',
                                  title: "KBBI"),
                            ),
                          ),
                          ToolsMenuCardDualLine(
                            width: width,
                            icon: Icons.book_rounded,
                            onPressed: () => Get.to(
                              () => ToolsMenuBrowser(
                                url:
                                    'https://www.oxfordlearnersdictionaries.com/',
                                title: "Oxford Dict",
                              ),
                            ),
                            textone: "Oxford",
                            texttwo: "Dict",
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
                            text: "Cymath",
                            icon: Icons.calculate,
                            onPressed: () => Get.to(CymathPage()),
                          ),
                          ToolsMenuCard(
                            width: width,
                            text: "Conjugator",
                            icon: Icons.book_sharp,
                            onPressed: () => Get.to(
                              () => ToolsMenuBrowser(
                                  url: 'https://en.bab.la/conjugation/english/',
                                  title: "Conjugator"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(30),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(5.0),
                  //   child: Container(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         ToolsMenuCard(
                  //           width: width,
                  //           animType: AnimationType.slideLeftToRight,
                  //           text: "Mathsisfun",
                  //           icon: Icons.calculate_outlined,
                  //           onPressed: Get.to(
                  //             () => ToolsMenuBrowser(
                  //                 url: 'https://www.mathsisfun.com/',
                  //                 animType: AnimationType.slideLeftToRight,
                  //                 title: "Mathsisfun"),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToolsMenuCardDualLine extends StatelessWidget {
  const ToolsMenuCardDualLine({
    @required this.width,
    @required this.onPressed,
    @required this.icon,
    @required this.textone,
    @required this.texttwo,
  });

  final double width;
  final onPressed;

  final icon;
  final String textone;
  final String texttwo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kToolsMenuButtonWidth,
      height: kToolsMenuButtonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          primary: kSecondColor,
          elevation: 5,
        ),
        onPressed: onPressed,
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
    @required this.onPressed,
    @required this.icon,
    @required this.text,
  });

  final double width;
  final onPressed;

  final icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kToolsMenuButtonWidth,
      height: kToolsMenuButtonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          primary: kSecondColor,
          elevation: 5,
        ),
        onPressed: onPressed,
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
