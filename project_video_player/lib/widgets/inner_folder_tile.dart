import 'package:flutter/material.dart';
import 'package:project_video_player/screens/video_player.dart';
import 'package:project_video_player/widgets/thumbnail_generator.dart';
import 'package:project_video_player/widgets/video_menu_sheet.dart';
import 'package:project_video_player/widgets/video_tile.dart';
import '../database/last_played.dart';
import '../models/last_played.dart';
import '../themes/colors.dart';

class InnerFolderVideoTile extends StatelessWidget {
  final index;
  final List<String> innerList;

  InnerFolderVideoTile({
    Key? key,
    required this.index,
    required this.innerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoPath = innerList[index];
    final videoName = videoPath.split('/').last;

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
          onLongPress: () {
            showModalBottomSheet(
                elevation: 5,
                isDismissible: true,
                context: context,
                builder: (context) => VideoInfoSheet(
                      video: innerList[index],
                    ));
          },
          onTap: () {

             final _model = LastPlayedModel(lastPlayedVideo: videoPath);
            addToLastPlayed(_model);
            refreshLastPlayed();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => LocalVideoPlayer(videoUrl: videoPath)));
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          tileColor: color_pureWhite,
          leading: Container(
              height: 40,
              width: 60,
              child: VideoThumnailGenerator(videoPath: videoPath)),
          trailing: IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: primaryColor,
            ),
            onPressed: () {
              showModalBottomSheet(
                  elevation: 5,
                  isDismissible: true,
                  context: context,
                  builder: (context) => VideoInfoSheet(
                        video: innerList[index],
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
