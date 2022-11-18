import 'dart:convert';

import 'package:flutter_youtube_app/data/model_api/model.dart';
import 'package:flutter_youtube_app/data/search_model/search.dart';
import 'package:http/http.dart' as http;

class ApiVideos {
  
  Future<List<Model>> getVideos() async {
    const apiKey = 'AIzaSyDA1XbbVqpXXmtbAPEtT_cVCN43RrMngCg';
    final uri =
        'https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics,contentDetails&chart=mostPopular&maxResults=10&key=$apiKey';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      Iterable list = jsonData['items'];
      return list.map((n) => Model.fromJson(n)).toList();
    } else {
      throw Exception('Произошло ошибка при получения данных');
    }
  }
}


class ApiVideoId {
  
  Future<List<Model>> getVideosId(String videoId) async {
    const apiKey = 'AIzaSyDA1XbbVqpXXmtbAPEtT_cVCN43RrMngCg';
    final uri =
        'https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics,contentDetails&id=$videoId&maxResults=10&key=AIzaSyDA1XbbVqpXXmtbAPEtT_cVCN43RrMngCg';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      Iterable list = jsonData['items'];
      return list.map((n) => Model.fromJson(n)).toList();
    } else {
      throw Exception('Произошло ошибка при получения данных');
    }
  }
}

class ApiSearch {
  Future<List<SearchModel>> searchVideos(String query) async {
    const apiKey = 'AIzaSyDA1XbbVqpXXmtbAPEtT_cVCN43RrMngCg';
    final uri =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=$query&key=$apiKey';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      Iterable list = jsonData['items'];
      return list.map((n) => SearchModel.fromJson(n)).toList();
    } else {
      throw Exception('Произошло ошибка при получения данных');
    }
  }
}
