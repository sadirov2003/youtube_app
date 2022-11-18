import 'package:flutter/widgets.dart';
import 'package:flutter_youtube_app/data/model_api/model.dart';



class FavoritePageModel extends ChangeNotifier {
  final List<Model> _favoriteVideos = [];
  List<Model> get favoriteVideos {
    return _favoriteVideos;
  }

  void add(Model item) {
    _favoriteVideos.add(item);
    notifyListeners();
  }

  void remove(Model item) {
    _favoriteVideos.remove(item);
    notifyListeners();
  }
}
class FavoritePageSearchingModel extends ChangeNotifier {
 
  final List<Model> _favoriteSearchVideos = [];

  List<Model> get favoriteSearchVideos {
    return _favoriteSearchVideos;
  }

  void add(Model item) {
    _favoriteSearchVideos.add(item);
    notifyListeners();
  }

  void remove(Model item) {
    _favoriteSearchVideos.remove(item);
    notifyListeners();
  }
}
