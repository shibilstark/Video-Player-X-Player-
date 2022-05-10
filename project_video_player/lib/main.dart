import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_video_player/models/fovorites_model.dart';
import 'package:project_video_player/models/last_played.dart';
import 'package:project_video_player/models/playlist_model.dart';
import 'package:project_video_player/screens/onboard_screend.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  if (!Hive.isAdapterRegistered(FavoritesModelAdapter().typeId)) {
    Hive.registerAdapter(FavoritesModelAdapter());
  }
  if (!Hive.isAdapterRegistered(PlayListModelAdapter().typeId)) {
    Hive.registerAdapter(PlayListModelAdapter());
  }
  if (!Hive.isAdapterRegistered(LastPlayedModelAdapter().typeId)) {
    Hive.registerAdapter(LastPlayedModelAdapter());
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  CheckScreen(),
    );
  }
}
