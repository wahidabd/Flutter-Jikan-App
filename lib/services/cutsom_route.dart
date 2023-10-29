import 'dart:convert';

import 'package:aniflix/screens/anime_detail.dart';
import 'package:aniflix/screens/favorite_screen.dart';
import 'package:aniflix/screens/home_screen.dart';
import 'package:aniflix/screens/search_screen.dart';
import 'package:aniflix/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class CustomRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const TabScreen());
      case '/homeScreen':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/searchScreen':
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case '/favoriteScreen':
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case '/detailScreen':
        final args = json.decode(settings.arguments.toString());
        final id = args['id'];
        final type = args['type'];
        return MaterialPageRoute(
          builder: (_) => AnimeDetail(id: id),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
