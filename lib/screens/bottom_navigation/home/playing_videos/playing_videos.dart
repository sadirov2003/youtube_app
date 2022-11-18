import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/data/model_api/model.dart';
import 'package:flutter_youtube_app/icons/my_app_icons.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/favorites/favorites.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayingVideos extends StatefulWidget {
  final channelTitle;
  final publishTime;
  final title;
  final viewCount;
  final youtubeKey;
  PlayingVideos(
      {required this.channelTitle,
      required this.publishTime,
      required this.title,
      required this.viewCount,
      required this.youtubeKey});

  @override
  State<PlayingVideos> createState() => _PlayingVideosState();
}

class _PlayingVideosState extends State<PlayingVideos> {
  late final YoutubePlayerController _controller;

 

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
    return YoutubePlayerBuilder(
        player: player,
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              title: const Text('Youtube Videos',
                  style: TextStyle(color: Colors.black)),
              centerTitle: true,
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    player,
                    Container(
                      margin: EdgeInsets.zero,
                      width: 340,
                      color: Colors.white,
                      padding: const EdgeInsets.only(right: 30, top: 5),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${widget.channelTitle} : ${widget.viewCount} просмотров - ${widget.publishTime}',
                            style: const TextStyle(
                                color: Colors.black45, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
