import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_video_player/common/common_functions.dart';
import 'package:project_video_player/database/favorites.dart';
import 'package:project_video_player/database/last_played.dart';
import 'package:project_video_player/screens/folder_view.dart';
import 'package:project_video_player/screens/menu_screen.dart';
import 'package:project_video_player/screens/playlist_screen.dart';
import 'package:project_video_player/screens/search.dart';
import 'package:project_video_player/screens/video_player.dart';
import 'package:project_video_player/screens/video_view.dart';
import 'package:project_video_player/test_screen.dart';
import 'package:project_video_player/themes/colors.dart';
import 'favorites_screen.dart';

final titleStyle =
    TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalKey = GlobalKey<ScaffoldState>();

  int tabIndex = 0;

  int curretnIndex = 0;

  final screens = [
    null,
    const FavoriteScreen(),
    PlayListScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: globalKey,
          bottomNavigationBar: myNavigationBar(context),
          appBar: homeAppBar(context: context),
          body: curretnIndex != 0
              ? screens[curretnIndex]
              : const TabBarView(children: [FolderView(), VideoView()]),
          floatingActionButton:
              curretnIndex == 0 && lastPlayedVideos.value.isNotEmpty
                  ? Container(
                      width: 60,
                      child: FloatingActionButton(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LocalVideoPlayer(
                                  videoUrl: lastPlayedVideos
                                      .value.last.lastPlayedVideo)));
                        },
                        backgroundColor: lightColor,
                      ),
                    )
                  : null,
        ),
      ),
    );
  }

  final screenNames = [
    "X Player",
    "Favorites",
    "PlayLists",
    "Menu",
  ];

  homeAppBar({required BuildContext context}) {
    return PreferredSize(
      child: AppBar(
          iconTheme: IconThemeData(color: primaryColor),
          backgroundColor: primaryColor,
          titleSpacing: 20,
          title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              children: [
                Lottie.asset(
                  "assets/lottie/logo.json",
                  width: 35,
                ),
                Gap(
                  W: 10,
                ),
                Text(
                  screenNames[curretnIndex],
                  style: titleStyle,
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: curretnIndex == 0
                  ? IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: Mysearch());
                      },
                      icon: const Icon(
                        Icons.search,
                        color: color_pureWhite,
                        size: 27,
                      ))
                  : Container(),
            )
          ],
          bottom: curretnIndex == 0
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      height: 35,
                      color: color_pureWhite,
                      child: TabBar(
                        tabs: const [
                          Tab(
                            child: Text(
                              "Folders",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 15),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Videos",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 15),
                            ),
                          )
                        ],
                        indicatorColor: lightColor,
                        indicatorWeight: 3,
                      ),
                    ),
                  ),
                )
              : null),
      preferredSize: curretnIndex == 0
          ? const Size.fromHeight(85)
          : const Size.fromHeight(50),
    );
  }

  myNavigationBar(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: curretnIndex,
          onTap: (index) => setState(() {
                curretnIndex = index;
              }),
          selectedIconTheme: const IconThemeData(color: primaryColor, size: 30),
          unselectedIconTheme: const IconThemeData(
            color: lightColor,
          ),
          selectedFontSize: 12,
          iconSize: 26,
          selectedItemColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.folder_outlined,
              ),
              label: "Home",
              activeIcon: Icon(Icons.folder_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: "Favorites",
              activeIcon: Icon(Icons.favorite_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play_outlined),
              label: "Playlists",
              activeIcon: Icon(Icons.playlist_play_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Watchlater",
              activeIcon: Icon(Icons.settings_rounded),
            ),
          ]),
    );
  }

  // myNavigationBar(BuildContext context) {
  //   return SizedBox(
  //     height: 60,
  //     width: double.infinity,
  //     child: BottomNavigationBar(

  //       elevation: 2,
  //         backgroundColor: color_pureWhite,
  //         currentIndex: curretnIndex,
  //         onTap: (index) => setState(() {
  //               curretnIndex = index;
  //             }),
  //         selectedIconTheme: IconThemeData(color: primaryColor, size: 30),
  //         unselectedIconTheme: IconThemeData(
  //           color: secondaryColor,
  //         ),
  //         selectedFontSize: 12,
  //         iconSize: 26,
  //         // selectedItemColor: Colors.white,
  //         showUnselectedLabels: false,
  //         showSelectedLabels: false,
  //         type: BottomNavigationBarType.fixed,
  //         items: const [
  //           BottomNavigationBarItem(
  //             icon: Icon(
  //               Icons.folder_outlined,
  //             ),
  //             label: "Home",
  //             activeIcon: Icon(Icons.folder_rounded),
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.favorite_outline),
  //             label: "Favorites",
  //             activeIcon: Icon(Icons.favorite_rounded),
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.playlist_play_outlined),
  //             label: "Playlists",
  //             activeIcon: Icon(Icons.playlist_play_rounded),
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.menu_open_outlined),
  //             label: "Settings",
  //             activeIcon: Icon(Icons.menu_open_rounded),
  //           ),
  //         ]),
  //   );
  // }
}
