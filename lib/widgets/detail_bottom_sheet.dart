import 'dart:convert';

import 'package:aniflix/config/styles.dart';
import 'package:aniflix/models/anime.dart';
import 'package:aniflix/widgets/button.dart';
import 'package:flutter/material.dart';

class DetailBottomSheet extends StatelessWidget {
  final Anime anime;

  const DetailBottomSheet({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BottomSheet(
      onClosing: () {},
      backgroundColor: Colors.grey.shade900,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(size),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: size.width * 0.4,
                              ),
                              child: Text(
                                anime.title!,
                                style: TextStyles.primaryTitle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              (anime.type == 'Movie')
                                  ? 'Movie'
                                  : '${anime.year ?? ''}  ${anime.episodes} Episodes',
                              style: TextStyles.secondaryTitle,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              anime.background ?? '',
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton().iconButton(
                        icon: Icons.close, onTap: () => Navigator.pop(context)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton().iconButton(
                    icon: Icons.play_circle_outline,
                    onTap: () {},
                    label: 'Play',
                  ),
                  CustomButton().iconButton(
                    icon: Icons.download_for_offline_outlined,
                    onTap: () {},
                    label: 'Download',
                  ),
                  CustomButton().iconButton(
                    icon: Icons.add_circle_outline,
                    onTap: () {},
                    label: 'My List',
                  ),
                  CustomButton().iconButton(
                    icon: Icons.share_outlined,
                    onTap: () {},
                    label: 'Share',
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Divider(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/detailScreen',
                    arguments: json.encode({
                      'id': anime.malId,
                      'type': 0,
                    }),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.info_outline),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Episodes & Info'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImage(size) {
    return Container(
      margin: const EdgeInsets.all(8),
      constraints: BoxConstraints(
        maxWidth: size.width * 0.24,
        maxHeight: 120,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: NetworkImage(
            anime.image!.largeImageUrl!,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
