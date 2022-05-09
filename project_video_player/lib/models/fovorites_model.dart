import 'package:hive_flutter/adapters.dart';
part 'fovorites_model.g.dart';

@HiveType(typeId: 1)
class FavoritesModel {

  @HiveField(0)
  final path;

  
  FavoritesModel({required this.path});
}
