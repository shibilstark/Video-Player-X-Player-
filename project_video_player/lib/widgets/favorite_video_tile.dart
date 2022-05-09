import 'package:flutter/material.dart';
import 'package:project_video_player/database/favorites.dart';
import 'package:project_video_player/screens/video_player.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:project_video_player/widgets/thumbnail_generator.dart';
import 'package:project_video_player/widgets/video_menu_sheet.dart';
import 'package:project_video_player/widgets/video_tile.dart';

class FavVideoTile extends StatefulWidget {
  const FavVideoTile({
    Key? key,
    required this.index,
  }) : super(key: key);
  final index;

  @override
  State<FavVideoTile> createState() => _FavVideoTileState();
}

class _FavVideoTileState extends State<FavVideoTile> {
  @override
  Widget build(BuildContext context) {
    final videoName =
        favoritesVideos.value[widget.index].path.toString().split("/").last;
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
                      video: favoritesVideos.value[widget.index].path,
                    ));
          },
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => LocalVideoPlayer(
                    videoUrl: favoritesVideos.value[widget.index].path)));
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          tileColor: color_pureWhite,
          leading: Container(
            height: 40,
            width: 60,
            child: VideoThumnailGenerator(
                videoPath: favoritesVideos.value[widget.index].path),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: primaryColor,
            ),
            onPressed: () {
              showModalBottomSheet(
                  elevation: 5,

                  // isDismissible: true,
                  context: context,
                  builder: (context) => VideoInfoSheet(
                        video: favoritesVideos.value[widget.index].path,

                        // vidoesList: allVideos.value,
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
