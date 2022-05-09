import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_video_player/common/common_functions.dart';
import 'package:project_video_player/screens/privacy_policy_screen.dart';
import 'package:project_video_player/screens/settings_screen.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:sizer/sizer.dart';
import 'home_screen.dart';

const aboutStyle = TextStyle(color: primaryColor, fontWeight: FontWeight.w500);

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color_dark,
      body: AboutBody(),
      appBar: aboutAppBar(context),
    );
  }
}

aboutAppBar(BuildContext context) {
  return PreferredSize(
      preferredSize: Size.fromHeight(50.h),
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
        titleSpacing: -5,
        title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              "About",
              style: titleStyle,
            )),
      ));
}

class AboutBody extends StatelessWidget {
  const AboutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            height: 100,
            decoration: BoxDecoration(
                color: color_pureWhite,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Lottie.asset("assets/lottie/logo.json", width: 60)),
                Gap(
                  W: 20,
                ),
                Text(
                  "X Player",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Gap(
            H: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Color.fromARGB(69, 176, 200, 240)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              smallTexture(context, "Version"),
              Gap(
                H: 5,
              ),
              Text(
                "v1.0.0.0",
                style: aboutStyle,
              ),
              Gap(
                H: 20,
              ),
              smallTexture(context, "Privacy"),
              Gap(
                H: 5,
              ),
              InkWell(
                child: Text(
                  "By using X Player, you agree to X Player's Privacy Policy",
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => PrivacyScreen()));
                },
              ),
              Gap(
                H: 20,
              ),
              smallTexture(context, "Support"),
              Gap(
                H: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please inform  bug reports, comments throgh ",
                    style: aboutStyle,
                  ),
                  Gap(
                    H: 5,
                  ),
                  InkWell(
                    child: Text(
                      "shibilhassank2002@gmail.com",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      lauchEmail(toMail: "shibilhassank2002@gmail.com");
                    },
                  ),
                ],
              ),
            ]),
          ),
          Gap(
            H: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Color.fromARGB(69, 176, 200, 240)),
            child: InkWell(
              child: Text(
                "Licences",
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                showLicensePage(context: context);
              },
            ),
          )
        ],
      ),
    );
  }
}
