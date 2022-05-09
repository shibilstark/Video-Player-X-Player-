import 'package:flutter/material.dart';
import 'package:project_video_player/screens/about_screen.dart';
import 'package:project_video_player/screens/home_screen.dart';
import 'package:project_video_player/screens/privacy_policy_screen.dart';
import 'package:project_video_player/screens/settings_screen.dart';
import 'package:project_video_player/test_screen.dart';
import 'package:project_video_player/themes/colors.dart';

import '../common/common_functions.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color_dark,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            children: [
              MenuTiles(
                text: "Settings",
                icon: Icons.settings_rounded,
                page: SettingsScreen(),
                ctx: context,
              ),
              Divider(
                color: secondaryColor,
              ),
              MenuTiles(
                text: "Share App",
                icon: Icons.share_rounded,
                page: TestScreen(),
                ctx: context,
              ),
              Divider(
                color: secondaryColor,
              ),
              MenuTiles(
                text: "Privacy Policy",
                icon: Icons.privacy_tip,
                page: PrivacyScreen(),
                ctx: context,
              ),
              Divider(
                color: secondaryColor,
              ),
              MenuTiles(
                text: "About",
                icon: Icons.info_rounded,
                page: AboutScreen(),
                ctx: context,
              ),
              Divider(
                color: secondaryColor,
              ),
              GestureDetector(
                onTap: () {
                  lauchEmail(toMail: "shibilhassank2002@gmail.com");
                },
                child: Container(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.email_rounded,
                          color: color_white,
                          size: 22,
                        ),
                        Gap(
                          W: 30,
                        ),
                        Text(
                          "Connect us",
                          style: TextStyle(
                              fontSize: 20,
                              color: color_white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuTiles extends StatelessWidget {
  final String text;
  final IconData icon;
  // ignore: prefer_typing_uninitialized_variables
  final page;
  final ctx;
  const MenuTiles(
      {Key? key,
      required this.text,
      required this.icon,
      required this.page,
      required BuildContext this.ctx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (text == "Share App") {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        }
      },
      child: Container(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Icon(
                icon,
                color: lightColor,
                size: 22,
              ),
              Gap(W: _width * 0.07),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 20,
                    color: lightColor,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
