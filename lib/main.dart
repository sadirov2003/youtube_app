import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/favorites/favorite_model.dart';
import 'package:flutter_youtube_app/screens/bottom_navigation/home/videos.dart';
import 'package:flutter_youtube_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
            ChangeNotifierProvider(
              create: (context) => FavoritePageModel(),
            ),
            ChangeNotifierProvider(
              create: (context) => Video(),
            ),
            ChangeNotifierProvider(
             create: (context) => SearchVideo(),
            )
    
          ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            unselectedLabelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
