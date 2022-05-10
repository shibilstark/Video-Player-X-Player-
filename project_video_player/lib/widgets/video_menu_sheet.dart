import 'package:flutter/material.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:project_video_player/widgets/play_list_folder_show.dart';
import 'package:project_video_player/widgets/video_properties.dart';

import '../common/common_functions.dart';
import '../database/favorites.dart';
import '../models/fovorites_model.dart';

class VideoInfoSheet extends StatefulWidget {
  // final index;
  // final List<String> vidoesList;

  final video;

  VideoInfoSheet(
      {Key? key,
      // required this.index,
      // required this.vidoesList,
      required String this.video})
      : super(key: key);

  @override
  State<VideoInfoSheet> createState() => _VideoInfoSheetState();
}

class _VideoInfoSheetState extends State<VideoInfoSheet> {
  VideoData? videoData;

  getvideoMetaData() async {
    final videoInfo = FlutterVideoInfo();
    videoData = await videoInfo.getVideoInfo(widget.video);
  }

  IconData _favIcon = Icons.favorite_border_outlined;

  Color _favIconColor = secondaryColor;

  int? videoFavIntex;

  // Color _bgOff = secondaryColor;
  @override
  Widget build(BuildContext context) {
    bool foundFav = false;
    final videoName = widget.video.split("/").last;

    for (var model in favoritesVideos.value) {
      if (widget.video == model.path) {
        foundFav = true;

        setState(() {
          _favIcon = Icons.favorite_rounded;
          videoFavIntex = favoritesVideos.value.indexOf(model);
          _favIconColor = primaryColor;
        });

        break;
      } else {
        foundFav = false;
        setState(() {
           _favIcon = Icons.favorite_outline;
          _favIconColor = color_smooth;
        });
      }
    }

    getvideoMetaData();
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color_pureWhite,
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: ListView(
          children: [
            Text(
              videoName,
              style: TextStyle(fontSize: 15, color: primaryColor),
            ),
            Divider(
              thickness: 2,
              color: secondaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                // color:  Colors.amber,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: secondaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          width: 60,
                          height: 60,
                          child: Center(
                              child: IconButton(
                            onPressed: () {
                              final favModel =
                                  FavoritesModel(path: widget.video);

                              if (foundFav) {
                                deleteVideoFromFavorites(videoFavIntex);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: Duration(milliseconds: 700),
                                        content: Text(
                                            "Video Removed from Favorites")));
                              } else {
                                addVideoToFavorites(favModel);

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: Duration(milliseconds: 700),
                                        content: Text(
                                            "Successfully Added to Favorites")));
                              }

                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              _favIcon,
                              size: 30,
                              color: _favIconColor,
                            ),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: secondaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          width: 60,
                          height: 60,
                          child: Center(
                              child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              playListShow(context, widget.video);
                              
                            },
                            icon: Icon(
                              Icons.playlist_play_outlined,
                              size: 30,
                              color: primaryColor,
                            ),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: secondaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          width: 60,
                          height: 60,
                          child: Center(
                              child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              shareFile(widget.video);
                              // playListShow(
                              //     context, widget.vidoesList[widget.index]);
                            },
                            icon: Icon(
                              Icons.share_rounded,
                              size: 30,
                              color: primaryColor,
                            ),
                          )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pop();

                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    content: VideoInfo(
                                      video: widget.video,
                                      videoData: videoData!,
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                  ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: lightColor,
                              border: Border.all(width: 0.1, color: color_dark),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          height: 50,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          // decoration: BoxDecoration(color: secondaryColor),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Properties",
                                  style: TextStyle(
                                      color: color_pureWhite, fontSize: 16),
                                ),
                                Icon(
                                  Icons.info_outline,
                                  size: 20,
                                  color: color_pureWhite,
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // child: Text("hello"),
    );
  }
}
