import 'package:flutter/material.dart';
import 'package:project_video_player/database/favorites.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:project_video_player/widgets/favorite_video_tile.dart';
import 'package:project_video_player/widgets/video_tile.dart';
import '../common/common_functions.dart';
import '../models/fovorites_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    refreshFavoritesList();
    return Scaffold(
      // backgroundColor: color_dark,
      body: FavoritesScreenBody(),
    );
  }
}

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
        valueListenable: favoritesVideos,
        builder: (BuildContext context, List<FavoritesModel> favoritesList,
            Widget? child) {
          return favoritesVideos.value.isEmpty
              ? Container(
                  child: const Center(
                      child: Text(
                    "No Favorite videos added",
                    style: TextStyle(color: primaryColor),
                  )),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Gap(
                      H: 10,
                    ),
                    // padding: EdgeInsets.all(_w / 30),
                    physics: const BouncingScrollPhysics(
                        parent: const AlwaysScrollableScrollPhysics()),
                    itemCount: favoritesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FavVideoTile(
                        index: index,
                      );
                    },
                  ),
                );
        });
  }
}
