import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../themes/colors.dart';

class VideoThumnailGenerator extends StatefulWidget {
  final videoPath;
  const VideoThumnailGenerator({Key? key, required String this.videoPath})
      : super(key: key);

  @override
  State<VideoThumnailGenerator> createState() => _VideoThumnailGeneratorState();
}

class _VideoThumnailGeneratorState extends State<VideoThumnailGenerator> {
  var thumbnail;

  thumbGenerate() async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: widget.videoPath,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      maxHeight:
          80, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    setState(() {
      thumbnail = fileName;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    thumbGenerate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 60,
      child: thumbnail == null
          ? Container(
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(
                Icons.play_arrow_rounded,
                size: 30,
                color: color_pureWhite,
              ))
          : ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
                File(thumbnail),
                width: 60,
                height: 40,
              ),
          ),
    );
  }
}
