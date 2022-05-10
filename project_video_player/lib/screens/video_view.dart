import 'package:flutter/material.dart';

import '../common/common_functions.dart';
import '../functions/fetch_videos.dart';
import '../themes/colors.dart';
import '../widgets/folder_tile.dart';
import '../widgets/video_tile.dart';

class VideoView extends StatelessWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
      builder: (BuildContext context, List<String> folderList, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.separated(
            separatorBuilder: (context, index) => Gap(
              H: 5,
            ),
            // padding: EdgeInsets.all(_w / 30),
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: allVideos.value.length,
            itemBuilder: (BuildContext context, int index) {
              return VideoTile(
                index: index,
               
              );
            },
          ),
        );
      },
      valueListenable: allVideos,
    );
  }
}
