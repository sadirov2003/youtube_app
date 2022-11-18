import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/data/model_api/model.dart';
import 'package:flutter_youtube_app/icons/my_app_icons.dart';
import 'package:flutter_youtube_app/icons/my_flutter_app_icons.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/channels/channels.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/favorites/favorite_model.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/favorites/favorites.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/components/search_container.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/displaying_videos/displaying_videos.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/searching_videos.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/videos.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  void onSelecTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            MyFlutterApp.youtube_play,
            color: Colors.red,
            size: 30,
          ),
          const Text(
            'Youtube',
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(width: 80),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyFlutterApp.bell,
              color: Colors.black54,
            ),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black54,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyFlutterApp.user,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          DisplayingVideos(),
          Channels(),
          Favorites(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(MyApp.film_play, color: Colors.black),
            label: 'Каналы',
          ),
          BottomNavigationBarItem(
            icon: Icon(MyApp.bookmark, color: Colors.black, size: 23),
            label: 'Избранное',
          ),
        ],
        onTap: onSelecTab,
      ),
    );
  }
}



/*class FavoriteProvider extends ChangeNotifier {
  late FavoritesModel _favoritesList;
  final List<int> _itemsIds = [];
  FavoritesModel get favoriteList => _favoritesList;

  set favoriteList(FavoritesModel newList) {
    _favoritesList = newList;
    notifyListeners();
  }

  List<FavoritesModel> get items =>
      _itemsIds.map((id) => _favoritesList.getById(id));

  void add(Item item) {
    _itemsIds.add(item.id);

    notifyListeners();
  }

  void remove(Item item) {
    _itemsIds.remove(item.id);
    notifyListeners();
  }
}
*/
/*
class FavoriteProvider extends ChangeNotifier {
  List<FavoritesModel> get favorites => _favorites;
  bool liking = true;

  void getFavorites(FavoritesModel favorite) async{
    final isExist = _favorites.contains(favorite);

    if (isExist) {
      _favorites.remove(favorite);
      liking = true;
    } else {
      _favorites.add(favorite);
      liking = false;
    }
    notifyListeners();
  }

  void removeFavorites(FavoritesModel favorite) {
    _favorites.forEach((value){
      if(value == favorite){
        _favorites.remove(value);
      }
      
    });
    notifyListeners();
  }

  bool isExist(FavoritesModel favorite) {
    final isExist = _favorites.contains(favorite);
    return isExist;
  }

  void clearFavorites() {
    _favorites = [];
    notifyListeners();
  }
}
*/
/*class DataWidgetModel extends ChangeNotifier {
  bool liking = true;
  FavoritesModel favoritesModel = FavoritesModel();
  set like(bool value) {
    liking = value;
    notifyListeners();
  }

  FavoritesModel favoritesVideo(Model value, bool like) {
    liking = like;
    favoritesModel.urlImage = value.urlImage;
    favoritesModel.title = value.title;
    favoritesModel.channelTitle = value.channelTitle;
    favoritesModel.viewCount = viewCountSetting(value.viewCount);
    favoritesModel.publishTime = timePublished(value.dataTime);
    favoritesModel.youtubeKey = value.videoId;
    notifyListeners();
    return favoritesModel;
  }
}

class DataWidgetProvider extends InheritedWidget {
  final DataWidgetModel model;
  const DataWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  static DataWidgetProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataWidgetProvider>();
  }

  @override
  bool updateShouldNotify(DataWidgetProvider oldWidget) {
    return model != oldWidget;
  }
}
*/