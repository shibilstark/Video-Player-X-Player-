import 'package:flutter/material.dart';
import 'package:project_video_player/screens/inner_playlist_screen.dart';
import 'package:project_video_player/widgets/video_tile.dart';
import '../database/playlist.dart';
import '../themes/colors.dart';

class PlayListFolderTile extends StatelessWidget {


  final index;

  PlayListFolderTile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final folderName = playLists.value[index].folderName;

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
            showDialog(
                context: context,
                builder: (Context) => AlertDialog(
                      backgroundColor: color_pureWhite,
                      contentPadding: EdgeInsets.all(40),
                      title: const Text(
                        "Do you want delete this Playlists?",
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
                              style: TextStyle(fontSize: 16, color: lightColor),
                            )),
                        TextButton(
                            onPressed: () {
                              deletePlayList(playListIndex: index);

                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Delete",
                              style: TextStyle(fontSize: 16, color: lightColor),
                            )),
                      ],
                    ));
          },
          onTap: () {

            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => InnerPlayListScreen(
                      index: index,
                    )));

                    print(" +=============================== ${index}");
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          tileColor: color_pureWhite,
          leading: const Icon(
            Icons.playlist_play_rounded,
            size: 40,
            color: secondaryColor,
          ),
          title: Text(
            folderName,
            style: folderTitleStyyle,
          ),
        ),
      ),
    );
  }
}














class RecentListTile extends StatelessWidget {



  RecentListTile({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final folderName = playLists.value[index].folderName;

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


            // showDialog(
            //     context: context,
            //     builder: (Context) => AlertDialog(
            //           backgroundColor: color_pureWhite,
            //           contentPadding: EdgeInsets.all(40),
            //           title: const Text(
            //             "Do you want delete this Playlists?",
            //             style: TextStyle(color: lightColor, fontSize: 18),
            //             textAlign: TextAlign.start,
            //           ),
            //           actions: [
            //             TextButton(
            //                 onPressed: () {
            //                   Navigator.of(context).pop();
            //                 },
            //                 child: const Text(
            //                   "Cancel",
            //                   style: TextStyle(fontSize: 16, color: lightColor),
            //                 )),
            //             TextButton(
            //                 onPressed: () {
            //                   deletePlayList(playListIndex: index);

            //                   Navigator.of(context).pop();
            //                 },
            //                 child: const Text(
            //                   "Delete",
            //                   style: TextStyle(fontSize: 16, color: lightColor),
            //                 )),
            //           ],
            //         ));
         
         
          },
          onTap: () {

            
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (ctx) => InnerPlayListScreen(
            //           index: index,
            //         )));

            //         print(" +=============================== ${index}");
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          tileColor: color_pureWhite,
          leading: const Icon(
            Icons.playlist_play_rounded,
            size: 40,
            color: secondaryColor,
          ),
          title: Text(
            "folderName",
            style: folderTitleStyyle,
          ),
        ),
      ),
    );
  }
}
