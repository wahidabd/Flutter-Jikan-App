import 'package:aniflix/config.dart';
import 'package:aniflix/common/constants.dart';
import 'package:aniflix/providers/anime_provider.dart';
import 'package:aniflix/services/cutsom_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setDefaultOrientation();
  setStatusBarColor();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AnimeProvider()),
      ],
      child: MaterialApp(
        title: 'Aniflix',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(color: Colors.black),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
          fontFamily: 'Roboto',
          brightness: Brightness.dark,
          canvasColor: Colors.black,
          colorScheme: const ColorScheme.dark(
            secondary: Colors.red,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        navigatorObservers: [routeObserver],
        initialRoute: '/',
        onGenerateRoute: CustomRoute.generateRoute,
      ),
    );
  }
}