import 'package:flutter/material.dart';
import 'package:project_video_player/widgets/playlist_add.dart';
import '../database/playlist.dart';
import '../models/playlist_model.dart';
import '../themes/colors.dart';

playListShow(BuildContext context, currentVidoePath) {
  refreshPlayList();

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              height: 450,
              width: 400,
              child: Column(children: [
                Container(
                  height: 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create new playList",
                          style: TextStyle(color: secondaryColor, fontSize: 15),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        content: PlayListAdd(),
                                      ));

                              refreshPlayList();
                            },
                            icon: Icon(
                              Icons.add,
                              color: secondaryColor,
                            ))
                      ]),
                ),
                Container(
                  height: 350,
                  child: ValueListenableBuilder(
                    builder: (BuildContext context,
                            List<PlayListModel> playLists, Widget? child) =>
                        PlayListSmallTile(
                      path: currentVidoePath,
                    ),
                    valueListenable: playLists,
                  ),
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(color: lightColor),
                      ),
                    ))
              ]),
            ),
          ));
}

class PlayListSmallTile extends StatelessWidget {



  final path;
  PlayListSmallTile({Key? key, required this.path}) : super(key: key);

  // final _obj = PlayListStateFulWidgetState();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => SizedBox(
              child: ListTile(
                onTap: () {
                  bool found = false;

                  for (String item in playLists.value[index].videosList) {
                    if (item == path) {
                      found = true;
                      break;
                    } else {
                      found = false;
                    }
                  }

                  if (found) {
                    Navigator.of(context).pop();

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text("Video already present ")));
                  } else {
                    addVideoToPlayListFolder(
                        folderintex: index, videoPath: path);
                    Navigator.of(context).pop();

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text("Video added successfully ")));

                 
                  }
                },
                leading: Icon(
                  Icons.folder_rounded,
                  color: secondaryColor,
                ),
                title: Text(playLists.value[index].folderName),
              ),
            ),
        itemCount: playLists.value.length,
        separatorBuilder: (context, index) => Divider(
              thickness: 0.1,
              color: secondaryColor,
              height: 0,
            ));
  }
}
