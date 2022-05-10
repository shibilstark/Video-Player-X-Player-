// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_video_player/models/last_played.dart';



ValueNotifier<List<LastPlayedModel>> lastPlayedVideos = ValueNotifier([]);

addToLastPlayed(LastPlayedModel _model) async {
  final _lp = await Hive.openBox<LastPlayedModel>("_lp");

  if (_lp.length <= 15) {
    _lp.add(_model);
  } else {
    _lp.deleteAt(0);
    _lp.add(_model);
  }
  refreshLastPlayed();
}

refreshLastPlayed() async {
  final _lp = await Hive.openBox<LastPlayedModel>("_lp");
  lastPlayedVideos.value.clear();
  lastPlayedVideos.value.addAll(_lp.values);
  // ignore: invalid_use_of_protected_member
  lastPlayedVideos.notifyListeners();
}

clearLastPlayed() async {
  final _lp = await Hive.openBox<LastPlayedModel>("_lp");

  await _lp.clear();
  refreshLastPlayed();
}
