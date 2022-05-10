import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_video_player/screens/home_screen.dart';
import 'package:project_video_player/themes/colors.dart';

import '../functions/fetch_videos.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen.withScreenFunction(
          backgroundColor: primaryColor,
          splashIconSize: 100,
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          splash: const SplashBody(),
          screenFunction: () async {
            await fetchVideosFromStorage();
        
            return HomeScreen();
          }),
    );
  }
}

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/lottie/logo.json"),
    );
  }
}
