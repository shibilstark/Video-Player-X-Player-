import 'package:hive_flutter/hive_flutter.dart';
part 'last_played.g.dart';

@HiveType(typeId: 3)
class LastPlayedModel {
  @HiveField(0)
  final String lastPlayedVideo;

  LastPlayedModel({required this.lastPlayedVideo});
}
