import 'package:flutter/material.dart';
import 'package:project_video_player/screens/home_screen.dart';
import 'package:project_video_player/themes/colors.dart';
import '../common/common_functions.dart';
import '../widgets/inner_folder_tile.dart';


class InnderFolder extends StatelessWidget {
  final ValueNotifier<List<String>> innerList;
  final folderName;
  const InnderFolder(
      {Key? key, required this.innerList, required String this.folderName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
        appBar: innerAppBar(context, folderName),
        body: InnerFolderView(
          innerList: innerList,
        ));
  }
}

class InnerFolderView extends StatelessWidget {
  final ValueNotifier<List<String>> innerList;

  const InnerFolderView({Key? key, required this.innerList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
      valueListenable: innerList,
      builder: (BuildContext context, List<String> innerList, Widget? child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: ListView.separated(
        separatorBuilder: (context, index) => Gap(
          H: 10,
        ),
        // padding: EdgeInsets.all(_w / 30),
        physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: innerList.length,
        itemBuilder: (BuildContext context, int index) {
          return InnerFolderVideoTile(
            index: index,
            innerList: innerList,
          );
        },
      ),
    );
      },
    );
  }
}


innerAppBar(BuildContext context, String folderName) {
  return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(color: color_dark),
        backgroundColor: primaryColor,
        titleSpacing: -5,
        title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              folderName,
              style: titleStyle,
            )),
      ));
}
