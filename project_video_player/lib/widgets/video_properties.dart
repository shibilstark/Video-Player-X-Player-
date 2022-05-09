import 'package:flutter/material.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:project_video_player/themes/colors.dart';

import '../common/common_functions.dart';

class VideoInfo extends StatelessWidget {
  final VideoData videoData;
  final String video;

  VideoInfo(
      {Key? key,
      // required this.index,
      required this.videoData,
      // required this.vidoesList})
      required this.video})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoPath = video;
    final videoName = videoPath.split("/").last;

    final fodlerName = videoPath.split("/")[videoPath.split("/").length - 2];

    return Container(
      width: 390,
      height: 600,
      decoration: BoxDecoration(
          color: color_pureWhite, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Properties",
                  style: TextStyle(color: primaryColor, fontSize: 18,fontWeight: FontWeight.w500),
                ),
                SizedBox(
                    height: 40,
                    width: 30,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                          color: primaryColor,
                        )))
              ],
            ),
            Divider(
              thickness: 2,
              color: secondaryColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                videoPropertiesTexture(context, "Vdeo Name", videoName),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                    context, "Conatining Folder", "${fodlerName}"),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "Vdeo Path",
                  videoData.path,
                ),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "dimension",
                  "${videoData.height}  x  ${videoData.width}",
                ),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "Duration",
                  "${videoData.duration! ~/ (1000 * 60)} Minutes",
                ),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "Size ",
                  "${sizeReduce(mb: videoData.filesize! ~/ (1000 * 1000))}",
                ),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "Mimetype",
                  "${videoData.mimetype}",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

videoPropertiesTexture(BuildContext context, String key, var data) {
  return Container(
      child: Row(
    children: [
      Container(
        width: 80,
        child: Text(
          key,
          style: const TextStyle(
              color: lightColor,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ),
      Container(
        width: 10,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ":",
              style: TextStyle(fontSize: 15, color: lightColor),
            ),
          ],
        ),
      ),
      Container(
          width: 220,
          child: Text(
            data,
            style: const TextStyle(
                fontSize: 15,
                color: lightColor,
                fontStyle: FontStyle.italic),
          )),
    ],
  ));
}
