import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/data/model_api/model.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/favorites/favorite_model.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/displaying_videos/displaying_videos.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/playing_videos/playing_videos.dart';

import 'package:flutter_youtube_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<FavoritePageModel>().favoriteVideos;
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(6, 8, 6, 2),
          child: Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayingVideos(
                            channelTitle: model[index].channelTitle,
                            publishTime: model[index].dataTime,
                            title: model[index].title,
                            viewCount: model[index].viewCount,
                            youtubeKey: model[index].videoId),
                      ),
                    );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 190,
                      height: 134,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(model[index].urlImage),
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      height: 134,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 15, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              model[index].channelTitle,
                              style: const TextStyle(color: Colors.black45),
                            ),
                            Text(
                                '${model[index].dataTime} - ${model[index].viewCount} просмотров',
                                style: const TextStyle(color: Colors.black45),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    onPressed: () {
                                      var favoritepage =
                                          context.read<FavoritePageModel>();
                                      favoritepage.remove(model[index]);
                                    },
                                    icon: const Icon(
                                      Icons.star,
                                      color: Colors.black87,
                                      size: 40,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
