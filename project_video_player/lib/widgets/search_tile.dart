// import 'package:flutter/material.dart';
// import 'package:project_video_player/widgets/video_menu_sheet.dart';
// import 'package:project_video_player/widgets/video_tile.dart';
// import '../functions/fetch_videos.dart';
// import '../themes/colors.dart';

// class SearchAllVideoTile extends StatelessWidget {
//   const SearchAllVideoTile({
//     Key? key,
//     required this.index,
//   }) : super(key: key);
//   final index;

//   @override
//   Widget build(BuildContext context) {
//     final videoName = allVideos.value[index].split("/").last;
//     return Card(
//       elevation: 2,
//       shadowColor: primaryColor,
//       child: Container(
//         decoration: BoxDecoration(
//           color: color_pureWhite,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         alignment: Alignment.center,
//         height: 60,
//         child: ListTile(
//           onLongPress: () {
//             showModalBottomSheet(
//                 elevation: 5,
//                 isDismissible: true,
//                 context: context,
//                 builder: (context) => VideoInfoSheet(
//                       video: allVideos.value[index],
//                     ));
//           },
//           onTap: () {},
//           contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//           // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//           tileColor: color_pureWhite,
//           leading: Container(
//             height: 40,
//             width: 60,
//             child: Container(
//                 decoration: BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius: BorderRadius.circular(5)),
//                 child: Icon(
//                   Icons.play_arrow_rounded,
//                   size: 30,
//                   color: color_pureWhite,
//                 )),
//           ),
//           trailing: IconButton(
//             icon: Icon(
//               Icons.more_vert_rounded,
//               color: primaryColor,
//             ),
//             onPressed: () {
//               showModalBottomSheet(
//                   elevation: 5,
//                   isDismissible: true,
//                   context: context,
//                   builder: (context) => VideoInfoSheet(
//                         video: allVideos.value[index],
//                       ));
//             },
//           ),
//           title: Text(
//             videoName,
//             style: folderTitleStyyle,
//           ),
//         ),
//       ),
//     );
//   }
// }
