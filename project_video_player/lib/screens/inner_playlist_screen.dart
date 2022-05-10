import 'package:flutter/material.dart';
import 'package:project_video_player/database/playlist.dart';
import 'package:project_video_player/models/playlist_model.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:project_video_player/widgets/video_tile.dart';
import '../common/common_functions.dart';
import '../widgets/play_list_inner_tile.dart';
import 'home_screen.dart';

class InnerPlayListScreen extends StatelessWidget {
  final index;
  const InnerPlayListScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playListName = playLists.value[index].folderName;
    refreshPlayList();
    return Scaffold(
      // backgroundColor: color_dark,
      body: PlayListInnerScreenBody(
        index: index,
      ),
      appBar: aboutAppBar(context: context, playListName: playListName),
    );
  }
}

aboutAppBar({required BuildContext context, required String playListName}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: const IconThemeData(color: color_white),
        backgroundColor: primaryColor,
        // titleSpacing: -5,
        title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              playListName,
              style: titleStyle,
            )),
      ));
}

class PlayListInnerScreenBody extends StatelessWidget {
  final index;
  const PlayListInnerScreenBody({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    refreshPlayList();
    return ValueListenableBuilder(
        valueListenable: playLists,
        builder: (BuildContext context, List<PlayListModel> playlists,
            Widget? child) {

              final innerList = playLists.value[index].videosList;
         
          return playLists.value[index].videosList.isEmpty
              ? Container(
                  child: const Center(
                      child: Text(
                    "No videos added",
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
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: playLists.value[index].videosList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PlayListInnerTile(
                          playListFolderIndex: this.index,
                          index: index,
                          playListInnerList: innerList);

                      //  PlayListInnerTile(
                      //   index: index,
                      //   playlistVideos: playLists.value[index].videosList,
                      // );
                    },
                  ),
                );
        });
  }
}
