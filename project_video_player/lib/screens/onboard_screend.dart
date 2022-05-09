import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:project_video_player/common/common_functions.dart';
import 'package:project_video_player/screens/splash_screen.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/permission.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  void initState() {
    super.initState();
    checkStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

const SAVE_KEY = "OneceLogged";

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    askPermission();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Lottie.asset("assets/lottie/logo.json", width: 150)),
                Gap(
                  H: 20,
                ),
                Text(
                  "X Player",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset("assets/img/introImage.png")),
                ),
              ],
            ),
          ),
          // image: Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 30),
          //   child: Container(
          //       margin: EdgeInsets.only(top: 50),
          //       child: Image.asset("assets/img/introImage.png")),
          // ),
          body: "",
          footer: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            onPressed: () {
              setStatus();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SplashScreen()));
              // pushToScreen(context: context, page: TestScreen());
            },
            child: Text("Get Start"),
          ),
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showNextButton: false,
    );
  }
}

checkStatus(BuildContext context) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final onceChecked = sharedPreferences.getBool(SAVE_KEY);

  if (onceChecked == null || onceChecked == false) {
    // pushToScreen(context: context, page: OnboardScreen());
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OnboardScreen()));
  } else {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SplashScreen()));
  }
}

setStatus() async {
  final _sharedPrefs = await SharedPreferences.getInstance();
  _sharedPrefs.setBool(SAVE_KEY, true);
}
