import 'package:aniflix/config/enum.dart';
import 'package:aniflix/config/shimmer.dart';
import 'package:aniflix/config/styles.dart';
import 'package:aniflix/providers/anime_provider.dart';
import 'package:aniflix/widgets/anime_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

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

class _AnimeGenreState extends State<AnimeGenre>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    final animeProvider = Provider.of<AnimeProvider>(context);
    final genreAnime = animeProvider.getAnimeByGenre(widget.id);

    return Container(
      width: size.width,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              widget.genre,
              style: TextStyles.primaryTitle,
            ),
          ),
          SizedBox(
            height: size.height * 0.24,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (animeProvider.dataStatus == DataStatus.loading)
                  ? 5
                  : genreAnime.length,
              itemBuilder: (context, index) {
                return animeProvider.dataStatus == DataStatus.loading
                    ? LoaderWidget.rectangular(
                        height: size.height * 0.22,
                        width: size.width * 0.32,
                      )
                    : AnimeWidget(
                        anime: genreAnime[index],
                      );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
