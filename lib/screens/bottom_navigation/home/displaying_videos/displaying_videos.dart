import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/data/model_api/model.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/favorites/favorite_model.dart';

import 'package:flutter_youtube_app/screens/bottom_navigation/home/playing_videos/playing_videos.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/videos.dart';
import 'package:provider/provider.dart';

class DisplayingVideos extends StatefulWidget {
  @override
  State<DisplayingVideos> createState() => _DisplayingVideosState();
}

class _DisplayingVideosState extends State<DisplayingVideos> {
  @override
  void initState() {
    context.read<Video>().get();
  }

  @override
  Widget build(BuildContext context) {
    final _video = context.watch<Video>().video;
    final _loading = context.watch<Video>().loading;
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: _loading
                ? Center(
                    child: Container(
                      child: const CircularProgressIndicator(),
                    ),
                  )
                : VideoInfo(video: _video),
          )
        ],
      ),
    );
  }
}

class VideoInfo extends StatelessWidget {
  final List<Model> video;
  VideoInfo({
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: video.length,
      itemBuilder: (BuildContext context, int index) {
        final modelVideo = video[index];
       

        return Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              if (modelVideo.urlImage.isNotEmpty)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayingVideos(
                            channelTitle: modelVideo.channelTitle,
                            publishTime: modelVideo.dataTime,
                            title: modelVideo.title,
                            viewCount: modelVideo.viewCount,
                            youtubeKey: modelVideo.videoId),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        child: AspectRatio(
                          aspectRatio: 570 / 320,
                          child: Container(
                            height: 320,
                            width: 320,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(modelVideo.urlImage),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black,
                          width: 60,
                          height: 20,
                          child: Text(
                            modelVideo.duration,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              TitleInfo(model: modelVideo),
            ],
          ),
        );
      },
    );
  }
}

class TitleInfo extends StatelessWidget {
  final Model model;

  TitleInfo({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final isInFavorite =
        context.watch<FavoritePageModel>().favoriteVideos.contains(model);

    return Stack(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            minimumSize: MaterialStateProperty.all(const Size(20, 60)),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlayingVideos(
                  channelTitle: model.channelTitle,
                  publishTime: model.dataTime,
                  title: model.title,
                  viewCount: model.viewCount,
                  youtubeKey: model.videoId,
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.zero,
            width: 340,
            color: Colors.white,
            padding: const EdgeInsets.only(right: 30, top: 5),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${model.channelTitle} : ${model.viewCount} просмотров - ${model.dataTime}',
                  style: const TextStyle(color: Colors.black45, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 320,
          top: 10,
          child: IconButton(
              padding: const EdgeInsets.only(bottom: 30),
              onPressed: isInFavorite
                  ? () {
                      var favoritepage = context.read<FavoritePageModel>();
                      favoritepage.remove(model);
                    }
                  : () {
                      var favoritepage = context.read<FavoritePageModel>();
                      favoritepage.add(model);
                    },
              icon: isInFavorite
                  ? const Icon(
                      Icons.star,
                      color: Colors.black87,
                      size: 40,
                    )
                  : const Icon(
                      Icons.star_border_outlined,
                      color: Colors.black87,
                      size: 40,
                    )),
        ),
      ],
    );
  }
}
