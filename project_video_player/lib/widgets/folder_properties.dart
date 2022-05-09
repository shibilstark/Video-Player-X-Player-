
import 'package:flutter/material.dart';
import 'package:project_video_player/functions/fetch_videos.dart';

import '../themes/colors.dart';

class FolderInfo extends StatelessWidget {
  final List<String> list;
  final index;
  FolderInfo({Key? key, required this.index, required this.list})
      : super(key: key);

  List<String>? listOfVideos = [];
  @override
  Widget build(BuildContext context) {
    for (String item in list) {
      var name = item.split("/").last;

      listOfVideos!.add(name);
    }

    return Container(
      width: 380,
      height: 500,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Properties",
                  style: TextStyle(color: primaryColor, fontSize: 17),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: lightColor,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
            Divider(
              thickness: 2,
              color: lightColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                folderPropertiesTexture(
                  context,
                  "Folder Name",
                  folderList.value[index].split("/").last,
                ),
                folderPropertiesTexture(
                  context,
                  "Folder Path",
                  folderList.value[index],
                ),
                folderPropertiesTexture(
                  context,
                  "Video count",
                  "${list.length}",
                ),
                folderPropertiesTexture(
                  context,
                  "Videos ",
                  "${listOfVideos!.join("\n")}",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

folderPropertiesTexture(BuildContext context, String key, var data) {
  return Container(
      child: Row(
    children: [
      Container(
        width: 80,
        child: Text(
          key,
          style: TextStyle(fontSize: 16),
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
              style: TextStyle(
                  fontSize: 15,
                  color: primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      Container(
          width: 220,
          child: Text(
            data,
            style: TextStyle(
                fontSize: 15, color: primaryColor, fontStyle: FontStyle.italic),
          )),
    ],
  ));
}
