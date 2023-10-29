import 'package:flutter/material.dart';

class AnimeGenre extends StatefulWidget {
  final int id;
  final String genre;

  const AnimeGenre({
    super.key,
    required this.id,
    required this.genre,
  });

  @override
  State<AnimeGenre> createState() => _AnimeGenreState();
}

class _AnimeGenreState extends State<AnimeGenre> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
