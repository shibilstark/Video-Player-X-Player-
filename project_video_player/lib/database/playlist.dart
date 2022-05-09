// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/playlist_model.dart';

ValueNotifier<List<PlayListModel>> playLists = ValueNotifier([]);

addNewPlaylist(PlayListModel data) async {
  final _pl = await Hive.openBox<PlayListModel>("_pl");

  await _pl.add(data);
  playLists.value.add(data);
  refreshPlayList();
}

refreshPlayList() async {
  final _pl = await Hive.openBox<PlayListModel>("_pl");

  playLists.value.clear();
  playLists.value.addAll(_pl.values);
  // ignore: invalid_use_of_protected_member
  playLists.notifyListeners();
}

deletePlayList({required int playListIndex}) async {
  final _pl = await Hive.openBox<PlayListModel>("_pl");

  await _pl.deleteAt(playListIndex);

  refreshPlayList();
}

clearPlayList() async {
  final _pl = await Hive.openBox<PlayListModel>("_pl");

  await _pl.clear();

  refreshPlayList();
}

addVideoToPlayListFolder(
    {required folderintex, required String videoPath}) async {
  final _pl = await Hive.openBox<PlayListModel>("_pl");

  _pl.values.elementAt(folderintex).videosList.add(videoPath);

  refreshPlayList();
  refreshPlayList();
}

removeVideoFromPlaylist({required playListIndex, required vidoeIndex}) async {
  final _pl = await Hive.openBox<PlayListModel>("_pl");

   _pl.values.elementAt(playListIndex).videosList.removeAt(vidoeIndex);

  refreshPlayList();
}



