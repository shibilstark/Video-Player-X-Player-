import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import '../database/last_played.dart';
import '../themes/colors.dart';

class LocalVideoPlayer extends StatefulWidget {
  const LocalVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  _LocalVideoPlayerState createState() => _LocalVideoPlayerState();
}

class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();

    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.file, widget.videoUrl);
    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
          placeholder: Center(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    color: secondaryColor,
                  ))),
          placeholderOnTop: true,
          autoPlay: true,
          fit: BoxFit.scaleDown,
          fullScreenByDefault: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            enableProgressBar: true,
            enableProgressBarDrag: true,
            progressBarPlayedColor: secondaryColor,
            playerTheme: BetterPlayerTheme.material,
            showControlsOnInitialize: true,
            enablePip: true,
            playbackSpeedIcon: Icons.shutter_speed_outlined,
            controlBarColor: Color.fromARGB(50, 0, 0, 0),
            enableSkips: true,
            enableOverflowMenu: false,
          )),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _betterPlayerController.dispose();
    refreshLastPlayed();
  }

  final AspectRatios = [16 / 9, 4 / 3, 1920 / 1080, 1080 / 720];

  @override
  Widget build(BuildContext context) {
    final video = widget.videoUrl.split("/").last;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(video),
      ),
      backgroundColor: Colors.black,
      body: BetterPlayer(
        controller: _betterPlayerController,
      ),
    );
  }
}
