import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:prefs/prefs.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'Screen/main_menu.dart';
import 'package:school_app/backend/notif_brain.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
  AwesomeNotifications().initialize(
    'resource://drawable/app_logo',
    [
      NotificationChannel(
        channelKey: 'progress_channel',
        channelName: 'progress notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
        enableVibration: true,
        playSound: true,
        vibrationPattern: mediumVibrationPattern,
        importance: NotificationImportance.High,
      ),
    ],
  );

  await Prefs.init();
  applySchedule(Prefs.getBool("notifStatus"));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final webView = new FlutterWebviewPlugin();

  @override
  void initState() {
    webView.close();
    AwesomeNotifications().displayedStream.listen((receivedNotification) {});
    super.initState();
  }

  @override
  void dispose() {
    AwesomeNotifications().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) => ThemeData(
          primarySwatch: Colors.blue,
          primaryColorDark: Colors.red,
          primaryColorLight: Colors.blue,
          accentColor: Colors.blue,
          brightness: brightness,
          scaffoldBackgroundColor: Colors.black12),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Matsanewaku',
          home: SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SplashScreenView(
      imageSrc: 'assets/icon/icon.png',
      imageSize: height ~/ 3.5,
      home: MainMenuPage(),
      duration: 1800,
      text: "By Nopal Gemink",
      //textType: TextType.NormalText,
      textStyle: GoogleFonts.quicksand(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
