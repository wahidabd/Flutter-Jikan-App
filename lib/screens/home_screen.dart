import 'package:aniflix/widgets/anime_genre.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildBanner(),
          const AnimeGenre(
            id: 1,
            genre: "Action",
          )
        ],
      ),
    );
  }

  Widget _buildBanner() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width,
      color: Colors.red,
    );
  }


  @override
  bool get wantKeepAlive => true;


}
