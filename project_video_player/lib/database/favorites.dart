// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member

import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_video_player/models/fovorites_model.dart';

ValueNotifier<List<FavoritesModel>> favoritesVideos = ValueNotifier([]);

addVideoToFavorites(FavoritesModel model) async {
  final _fav_db = await Hive.openBox<FavoritesModel>("_fav_db");

  await _fav_db.add(model);
  favoritesVideos.value.add(model);
}

refreshFavoritesList() async {
  final _fav_db = await Hive.openBox<FavoritesModel>("_fav_db");
  favoritesVideos.value.clear();
  favoritesVideos.value.addAll(_fav_db.values);
  // ignore: invalid_use_of_visible_for_testing_member
  favoritesVideos.notifyListeners();
}

deleteVideoFromFavorites(index) async {
  final _fav_db = await Hive.openBox<FavoritesModel>("_fav_db");
  await _fav_db.deleteAt(index);
  refreshFavoritesList();
}

clearAllFavoritesList() async {
  final _fav_db = await Hive.openBox<FavoritesModel>("_fav_db");
  await _fav_db.clear();
  favoritesVideos.value.clear();
  refreshFavoritesList();
}
