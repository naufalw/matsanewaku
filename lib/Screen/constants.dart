import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var kMainColor = Color(0xFF0029FF);
var kBackGroundColor = Color(0xFF060518);
var kSecondColor = Color(0xFF3362CC);
var kAppBarIconSize = ScreenUtil().setSp(90);
var kAppBarTopMargin = ScreenUtil().setHeight(140);
var kAppBarFontSize = ScreenUtil().setSp(120.0);
var kToolsMenuButtonHeight = ScreenUtil().setHeight(350);
var kToolsMenuButtonWidth = ScreenUtil().setWidth(480);
var kNativeAppBarFontSize = ScreenUtil().setSp(60);
var kWidth = 414.0;
var kHeight = 896.0;

class FeaturedVidCard extends StatelessWidget {
  final String thumbnailURL;
  final Function onTap;
  final String title;

  const FeaturedVidCard({
    Key key,
    @required this.thumbnailURL,
    this.onTap,
    this.title,
  })  : assert(thumbnailURL != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ScreenUtil() == null) {
      ScreenUtil.init(
        context,
        designSize: Size(
          kWidth,
          kHeight,
        ),
        allowFontScaling: true,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        ScreenUtil().setWidth(10),
      ),
      child: Container(
        width: ScreenUtil().setWidth(374),
        height: ScreenUtil().setHeight(222),
        color: kMainColor,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CachedNetworkImage(
              width: ScreenUtil().setWidth(374),
              height: ScreenUtil().setHeight(222),
              fit: BoxFit.cover,
              imageUrl: thumbnailURL,
            ),
            Opacity(
              opacity: 0.35,
              child: Container(
                width: ScreenUtil().setWidth(374),
                height: ScreenUtil().setHeight(222),
                color: Color(0xff4D4E51),
              ),
            ),
            Icon(
              FontAwesomeIcons.playCircle,
              color: Colors.white,
              size: ScreenUtil().setSp(36.0),
            ),
            Positioned(
              bottom: ScreenUtil().setHeight(10),
              left: ScreenUtil().setWidth(20),
              child: Container(
                width: 315,
                child: Text(
                  '${title ?? 'Untitled'}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(16.0),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  width: ScreenUtil().setWidth(374),
                  height: ScreenUtil().setHeight(222),
                  // color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
