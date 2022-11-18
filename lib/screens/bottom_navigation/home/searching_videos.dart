import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/data/api.dart';
import 'package:flutter_youtube_app/data/model_api/model.dart';
import 'package:flutter_youtube_app/data/search_model/search.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/favorites/favorite_model.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/displaying_videos/displaying_videos.dart';

import 'package:flutter_youtube_app/screens/bottom_navigation/home/playing_videos/playing_videos.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/videos.dart';
import 'package:provider/provider.dart';


class MySearchDelegate extends SearchDelegate {
  List<String> suggestions = [
    'flutter programmer',
    'http request',
    'top companies',
    'собеседовании',
    'dio in flutter',
    'bloc && cubit',
    'programming',
    'ООП в Dart',
    'traveling',
    'windows 7 in 2022'
  ];
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        return close(context, null);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      )
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchVideos(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return Center(
            child: ListTile(
              title: Text(
                suggestion,
                style: TextStyle(
                  fontSize: 17,
                ),
                ),
              onTap: () {
                query = suggestion;
              },
            ),
          );
        });
  }
}

class SearchVideos extends StatefulWidget {
  final query;
  const SearchVideos({
    required this.query,
  });

  @override
  State<SearchVideos> createState() => _SearchVideosState();
}

class _SearchVideosState extends State<SearchVideos> {
  

  @override
  void initState() {
    context.read<SearchVideo>().get(widget.query);
  }



  @override
  Widget build(BuildContext context) {
    final _video = context.watch<SearchVideo>().video;
    final _loading = context.watch<SearchVideo>().loading;
    return Expanded(
      child: _loading
          ? Center(
              child: Container(
                child: const CircularProgressIndicator(),
              ),
            )
          : VideoInfo(video: _video),
    );
  }
}

