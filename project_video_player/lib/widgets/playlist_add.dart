import 'package:flutter/material.dart';
import 'package:project_video_player/database/playlist.dart';
import 'package:project_video_player/models/playlist_model.dart';
import 'package:project_video_player/themes/colors.dart';

TextEditingController playListNameController = TextEditingController();

class PlayListAdd extends StatefulWidget {
  const PlayListAdd({Key? key}) : super(key: key);

  @override
  State<PlayListAdd> createState() => _PlayListAddState();
}

class _PlayListAddState extends State<PlayListAdd> {
  final _formKey = GlobalKey<FormState>();

  bool isDataMatched = true;
  bool nameMatch = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: 300,
      decoration: BoxDecoration(color: color_pureWhite),
      child: Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: lightColor),
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 240, 240, 240),
                          filled: true,
                          hintStyle: TextStyle(color: secondaryColor),
                          hintText: "playlist name ....",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: color_pureWhite,
                          ))),
                      controller: playListNameController,
                   
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Visibility(
                          visible: !isDataMatched,
                          child: Text(
                            "Playlist Already Exist",
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Visibility(
                          visible: !nameMatch,
                          child: Text(
                            "Name can't be empty",
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        playListNameController.clear();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: lightColor),
                      )),
                  TextButton(
                    onPressed: () async {
                      bool found = false;
                      for (var model in playLists.value) {
                        if (model.folderName ==
                            playListNameController.value.text.trim()) {
                          setState(() {
                            found = true;
                          });
                          break;
                        } else {
                          continue;
                        }
                      }

                      if (found) {
                        playListNameController.clear();
                        setState(() {
                          isDataMatched = false;
                        });
                        existDisappear();
                      } else if (playListNameController.value.text
                              .trim()
                              .isEmpty ||
                          playListNameController.value.text.trim() == null) {
                        setState(() {
                          nameMatch = false;
                        });
                        emptyDisappear();
                      } else {
                        final _model = PlayListModel(
                            folderName:
                                playListNameController.value.text.trim(),
                            videosList: []);

                        addNewPlaylist(_model);

                        Navigator.of(context).pop();

                        refreshPlayList();
                        playListNameController.clear();

                        print(playLists.value.length);
                      }
                    },
                    child: Text("Create", style: TextStyle(color: lightColor)),
                  )
                ],
              )
            ]),
      ),
    );
  }

  existDisappear() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isDataMatched = true;
    });
  }

  emptyDisappear() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      nameMatch = true;
    });
  }
}
