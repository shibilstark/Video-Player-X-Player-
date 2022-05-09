import 'package:flutter/material.dart';
import 'package:project_video_player/database/last_played.dart';
import 'package:project_video_player/functions/fetch_videos.dart';
import 'package:project_video_player/models/last_played.dart';
import 'package:project_video_player/screens/video_player.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:project_video_player/widgets/video_menu_sheet.dart';

const folderTitleStyyle = TextStyle(color: primaryColor, fontSize: 16);

class VideoTile extends StatelessWidget {
  const VideoTile({
    Key? key,
    required this.index,
  }) : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    final videoName = allVideos.value[index].split("/").last;
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
                      video: allVideos.value[index],
                    ));
          },
          onTap: () {
            final _model =
                LastPlayedModel(lastPlayedVideo: allVideos.value[index]);
            addToLastPlayed(_model);
            refreshLastPlayed();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) =>
                    LocalVideoPlayer(videoUrl: allVideos.value[index])));
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          tileColor: color_pureWhite,
          leading: Container(
              height: 40,
              width: 60,
              child:
                  // VideoThumnailGenerator(
                  //   videoPath: allVideos.value[index],
                  // ))Container(
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
              showModalBottomSheet(
                  elevation: 5,
                  isDismissible: true,
                  context: context,
                  builder: (context) => VideoInfoSheet(
                        video: allVideos.value[index],
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
