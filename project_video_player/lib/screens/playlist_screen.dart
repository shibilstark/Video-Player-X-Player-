import 'package:flutter/material.dart';
import 'package:project_video_player/database/playlist.dart';
import 'package:project_video_player/themes/colors.dart';
import '../common/common_functions.dart';
import '../database/playlist.dart';
import '../models/playlist_model.dart';
import '../widgets/playlist_add.dart';
import '../widgets/playlist_tile.dart';






class PlayListScreen extends StatelessWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    refreshPlayList();
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: lightColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    backgroundColor: color_pureWhite,
                    content: PlayListAdd(),
                  ));
        },
        child: Icon(Icons.add),
      ),
      body: PlayListScreenBody(),
    );
  }
}

class PlayListScreenBody extends StatelessWidget {
  const PlayListScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    refreshPlayList();

    return ValueListenableBuilder(
      builder:
          (BuildContext context, List<PlayListModel> playList, Widget? child) {
        return playLists.value.isEmpty
            ? Center(
                child: Container(
                    child: Text(
                "Playlist empty",
                style: TextStyle(color: color_white),
              )))
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Gap(
                      H: 10,
                    ),
                    // padding: EdgeInsets.all(_w / 30),
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: playList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PlayListFolderTile(index: index);
                    },
                  ),
                ),
              );
      },
      valueListenable: playLists,
    );
  }
}
