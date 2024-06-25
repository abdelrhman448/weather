import 'package:flutter/material.dart';
import 'package:weather/main.dart';

class SizeConfig extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;



  static double width = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.last).size.width;
  static double height = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.last).size.height;
  static double topPadding = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.last).viewPadding.top;


  const SizeConfig({
    Key? key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);


  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 700;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 700 && MediaQuery.of(context).size.width <= 1100;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;


  static double getHeight(double height,)=> MediaQuery.of(weatherNavigatorKey.currentState!.context).size.height*(height/932);
  static double getWidth(double width,)=> MediaQuery.of(weatherNavigatorKey.currentState!.context).size.width*(width/430);
  static double getFont(double font,)=> SizeConfig.height*(font/932);



  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1100) {
      return desktop!;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile!;
    }
  }
}

