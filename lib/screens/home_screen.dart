import 'package:aniflix/config/shimmer.dart';
import 'package:aniflix/providers/anime_provider.dart';
import 'package:aniflix/widgets/anime_genre.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildBanner(),
          const AnimeGenre(
            id: 1,
            genre: "Action",
          ),
          const AnimeGenre(
            id: 2,
            genre: "Adventure",
          ),
          const AnimeGenre(
            id: 22,
            genre: "Romance",
          ),
          const AnimeGenre(
            id: 4,
            genre: "Comedy",
          )
        ],
      ),
    );
  }

  Widget _buildBanner() {
    final size = MediaQuery.of(context).size;
    return Consumer<AnimeProvider>(
      builder: (_, animeProvider, __) {
        return animeProvider.bannerAnime == null
            ? const BannerLoader()
            : Stack(
                children: [
                  Container(
                    height: size.height * 0.5,
                    width: size.width,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          animeProvider.bannerAnime!.image!.largeImageUrl!,
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      height: 80,
                      width: size.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black45,
                            Colors.black87,
                            Colors.black87,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            0.0,
                            0.15,
                            0.3,
                            0.45,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
