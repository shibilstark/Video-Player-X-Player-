import 'package:flutter/material.dart';
import 'package:project_video_player/functions/fetch_videos.dart';
import 'package:project_video_player/themes/colors.dart';
import '../screens/inner_folder_screen.dart';
import 'folder_properties.dart';

const folderTitleStyyle = TextStyle(color: primaryColor, fontSize: 16);

class FolderTile extends StatelessWidget {
  final index;
  FolderTile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final folderName = folderList.value[index].split("/").last;

    ValueNotifier<List<String>> currentFolderList = ValueNotifier([]);

    var folderPath = folderList.value[index];

    for (String item in allVideos.value) {
      if (item == folderPath + "/" + item.split("/").last) {
        currentFolderList.value.add(item);
      }
    }
    currentFolderList.notifyListeners();

    return Card(
      elevation: 2,
      shadowColor: primaryColor,
      child: Container(
        decoration: BoxDecoration(
          color: color_white,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        height: 60,
        child: ListTile(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: FolderInfo(
                        index: index,
                        list: currentFolderList.value,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ));
          },
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => InnderFolder(
                      innerList: currentFolderList,
                      folderName: folderName.toString(),
                    )));
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          tileColor: color_white,
          subtitle: Text("${currentFolderList.value.length} Videos",style: TextStyle(color: secondaryColor,fontSize: 12),),
          leading: const Icon(
            Icons.folder_rounded,
            size: 50,
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
