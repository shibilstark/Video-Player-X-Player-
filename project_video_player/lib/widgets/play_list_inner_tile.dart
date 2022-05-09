import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_video_player/database/favorites.dart';
import 'package:project_video_player/database/last_played.dart';
import 'package:project_video_player/database/playlist.dart';
import 'package:project_video_player/models/last_played.dart';
import 'package:project_video_player/screens/video_player.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:project_video_player/widgets/thumbnail_generator.dart';
import 'package:project_video_player/widgets/video_menu_sheet.dart';
import 'package:project_video_player/widgets/video_tile.dart';

class PlayListInnerTile extends StatelessWidget {
  final List<String> playListInnerList;
  final playListFolderIndex;

  const PlayListInnerTile(
      {Key? key,
      required this.index,
      required this.playListInnerList,
      required this.playListFolderIndex})
      : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    final videoName = playListInnerList[index].split("/").last;
    return Card(
      elevation: 2,
      shadowColor: primaryColor,
      child: Container(
        decoration: BoxDecoration(
          color: color_pureWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        height: 60,
        child: ListTile(
          onTap: () {
            final _model =
                LastPlayedModel(lastPlayedVideo: playListInnerList[index]);
            addToLastPlayed(_model);
            refreshLastPlayed();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) =>
                    LocalVideoPlayer(videoUrl: playListInnerList[index])));
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          tileColor: color_pureWhite,
          leading: Container(
              height: 40,
              width: 60,
              child:
                  
                  Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 30,
                        color: color_pureWhite,
                      ))),

          trailing: IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: primaryColor,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (Context) => AlertDialog(
                        backgroundColor: color_pureWhite,
                        contentPadding: EdgeInsets.all(40),
                        title: const Text(
                          "Do you want to remove this video ?",
                          style: TextStyle(color: lightColor, fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Cancel",
                                style:
                                    TextStyle(fontSize: 16, color: lightColor),
                              )),
                          TextButton(
                              onPressed: () {
                                removeVideoFromPlaylist(
                                    playListIndex: index, vidoeIndex: index);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Clear",
                                style:
                                    TextStyle(fontSize: 16, color: lightColor),
                              )),
                        ],
                      ));
            },
          ),
          title: Text(
            videoName,
            style: folderTitleStyyle,
          ),
        ),
      ),
    );
  }
}
