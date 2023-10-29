import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future setDefaultOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future setLandscapeOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

void launcherUrl(url) async => await canLaunchUrl(url)
    ? await launchUrl(url)
    : throw 'Could not launch $url';

void setStatusBarColor(){
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

void hideStatusBar() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

void resetStatusBar() => SystemChrome.restoreSystemUIOverlays();