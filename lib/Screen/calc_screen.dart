import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_transitions_route/navigator_transitions_route.dart';
import 'package:school_app/Screen/tools_menu.dart';

class CalcScreen extends StatefulWidget {
  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          NavigatorTransitionsRoute(
              context: context,
              child: ToolsMenu(),
              animation: AnimationType.slideRightToLeft,
              duration: Duration(milliseconds: 300),
              replacement: true);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            title: Text("Calculator", style: GoogleFonts.fredokaOne()),
            centerTitle: true,
            leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                ),
                onTap: () {
                  NavigatorTransitionsRoute(
                      context: context,
                      child: ToolsMenu(),
                      animation: AnimationType.slideRightToLeft,
                      duration: Duration(milliseconds: 300),
                      replacement: true);
                }),
          ),
          body: SimpleCalculator(
            theme: CalculatorThemeData(),
          ),
        ),
      ),
    );
  }
}
