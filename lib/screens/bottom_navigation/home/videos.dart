import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/data/api.dart';
import 'package:flutter_youtube_app/data/model_api/model.dart';
import 'package:flutter_youtube_app/data/search_model/search.dart';


class Video extends ChangeNotifier {
  final apiVideos = ApiVideos();
  List<Model> _video = [];
  bool loading = true;

  void get() async {
    final video = await apiVideos.getVideos();
    _video = video;
    loading = false;
    notifyListeners();
  }

  List<Model> get video {
    return _video;
  }

}

class SearchVideo extends ChangeNotifier{
  final videos = ApiVideoId();
  final searchVideo = ApiSearch();
  List<SearchModel> _search = [];
  List<Model> _video = [];
  bool loading = true;

  void get(String query) async {
    final search = await searchVideo.searchVideos(query);
    _search = search;
    List<String> videoId = [];
    for (int i = 0; i < _search.length; i++) {
      if (_search[i].videoId != null) videoId.add(_search[i].videoId!);
    }
    final id = cleaningString(videoId);
    final video = await videos.getVideosId(id);
    _video = video;
    loading = false;
    notifyListeners();

  }

  List<Model> get video {
    return _video;
  }


  String cleaningString(List key) {
    final cleaning1 = key.toString().replaceAll('[', '');
    final cleaning2 = cleaning1.replaceAll(' ', '');
    final id = cleaning2.replaceAll(']', '');
    return id;
  }

}
