import 'package:hive_flutter/adapters.dart';
part 'playlist_model.g.dart';

@HiveType(typeId: 2)
class PlayListModel {
  @HiveField(0)
  final String folderName;
  @HiveField(1)
  final List<String> videosList;

  PlayListModel({required this.folderName, required this.videosList});
}
