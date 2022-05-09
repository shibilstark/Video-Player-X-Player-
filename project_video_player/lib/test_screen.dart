import 'package:flutter/material.dart';
import 'package:project_video_player/themes/colors.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: Center(
        child: Container(
          color: color_smooth,
          // height: 150,
          // width: 350,
          child: Container(
            color: color_smooth,
            child: ListTile(
              tileColor: color_grey,
              leading: Icon(
                Icons.folder_outlined,
                color: Colors.white70,
              ),
              title: Text(
                "halloTitle",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TestContainer extends StatelessWidget {
  const TestContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Center(
      child: Container(
        color: color_dark,
      ),
    ));
  }
}
