import 'package:flutter/material.dart';
import 'package:project_video_player/common/common_functions.dart';
import 'package:project_video_player/widgets/video_tile.dart';
import '../functions/fetch_videos.dart';
import '../themes/colors.dart';



class Mysearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listItems = query.isEmpty
        ? allVideos.value
        : allVideos.value
            .where((element) => element
                .split("/")
                .last
                .toLowerCase()
                .contains(query.toLowerCase().toString()))
            .toList();

    return listItems.isEmpty
        ? const Center(child: Text("No Data Found!"))
        : Container(
   
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Gap(
                        H: 10,
                      ),
                  itemCount: listItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        // ListTile(
                        //   title: Text(listItems[index].split("/").last),
                        //   onTap: () {},
                        // ),
                        VideoTile(
                          index: index,
                        ),
                      ],
                    );
                  }),
            ),
          );
  }
}


