import 'package:flutter/material.dart';
import 'package:project_video_player/database/last_played.dart';
import 'package:project_video_player/database/playlist.dart';
import 'package:project_video_player/functions/fetch_videos.dart';
import 'package:project_video_player/screens/home_screen.dart';
import 'package:project_video_player/themes/colors.dart';

import '../common/common_functions.dart';
import '../database/favorites.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SettingsBody(),
      appBar: SettingsAppBar(context),
    );
  }
}

SettingsAppBar(BuildContext context) {
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
        iconTheme: const IconThemeData(color: color_white),
        backgroundColor: primaryColor,
        // titleSpacing: -5,
        title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              "Settings",
              style: titleStyle,
            )),
      ));
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double lineHeight = 35;

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: const Color.fromARGB(69, 114, 135, 168),
                  color: Color.fromARGB(69, 176, 200, 240),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallTexture(context, "Refresh"),
                    SizedBox(
                      height: lineHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Refresh Library",
                            style: TextStyle(
                              color: lightColor,
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Refreshing Video Libraries",
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: primaryColor,
                                                    ))
                                              ]),
                                        ));

                                await Future.delayed(Duration(seconds: 1));

                                fetchVideosFromStorage();
                                createFolderView();

                                refreshFavoritesList();
                                refreshLastPlayed();
                                refreshPlayList();

                                Navigator.of(context).pop();
                              },
                              child: Text("clear",
                                  style: TextStyle(color: lightColor)))
                        ],
                      ),
                    ),
                  ]),
            ),
            Gap(
              H: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: const Color.fromARGB(69, 114, 135, 168),
                  color: Color.fromARGB(69, 176, 200, 240),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  smallTexture(context, "General"),
                  SizedBox(
                    height: lineHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Clear Favorites",
                          style: TextStyle(
                            color: lightColor,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (Context) => AlertDialog(
                                        backgroundColor: color_pureWhite,
                                        contentPadding: EdgeInsets.all(40),
                                        title: const Text(
                                          "Do you want to clear complete Favorites?",
                                          style: TextStyle(
                                              color: lightColor, fontSize: 18),
                                          textAlign: TextAlign.start,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: lightColor),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                clearAllFavoritesList();
                                                refreshFavoritesList();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Clear",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: lightColor),
                                              )),
                                        ],
                                      ));
                            },
                            child: Text("clear",
                                style: TextStyle(color: lightColor)))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: lineHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Clear Playlists",
                          style: TextStyle(color: lightColor),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (Context) => AlertDialog(
                                        backgroundColor: color_pureWhite,
                                        contentPadding: EdgeInsets.all(40),
                                        title: const Text(
                                          "Do you want to clear Complete Playlists?",
                                          style: TextStyle(
                                              color: lightColor, fontSize: 18),
                                          textAlign: TextAlign.start,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: lightColor),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                clearPlayList();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Clear",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: lightColor),
                                              )),
                                        ],
                                      ));
                            },
                            child: Text("clear",
                                style: TextStyle(color: lightColor)))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: lineHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Clear Last Played",
                          style: TextStyle(color: lightColor),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (Context) => AlertDialog(
                                        backgroundColor: color_pureWhite,
                                        contentPadding: EdgeInsets.all(40),
                                        title: const Text(
                                          "Do you want to clear Last Played ?",
                                          style: TextStyle(
                                              color: lightColor, fontSize: 18),
                                          textAlign: TextAlign.start,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: lightColor),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                clearLastPlayed();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Clear",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: lightColor),
                                              )),
                                        ],
                                      ));
                            },
                            child: Text("clear",
                                style: TextStyle(color: lightColor)))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

smallTexture(BuildContext context, String data) {
  double _width = MediaQuery.of(context).size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        data,
        style: TextStyle(color: secondaryColor, fontSize: _width * 0.03),
      ),
      const Gap(
        H: 5,
      )
    ],
  );
}
