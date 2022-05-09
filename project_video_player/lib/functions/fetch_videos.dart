import 'package:flutter/widgets.dart';
import 'package:project_video_player/functions/fetch_from_storage.dart';

ValueNotifier<List<String>> allVideos = ValueNotifier([]);

onSuccess(List<String> vidoeListFromStorage) {
  allVideos.value = vidoeListFromStorage;
  allVideos.value
      .sort((a, b) => a.split("/").last.compareTo(b.split("/").last));
  allVideos.notifyListeners();
}

fetchVideosFromStorage() async {
  List<String> query = [".mp4", ".avi", "mkv", "3gp"];
  SearchFilesInStorage.searchInStorage(query, onSuccess, (p0) {});
}

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

refreshNotifiers() {
  allVideos.notifyListeners();
  folderList.notifyListeners();
}

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

ValueNotifier<List<String>> folderList = ValueNotifier([]);

clearFolderList() {
  folderList.value.clear();
}

folderBuilder() {
  folderList.value.clear();
  for (String item in allVideos.value) {
    var pathList = item.split("/");

    pathList.removeLast();

    var path = pathList.join("/");

    if (folderList.value.contains(path)) {
      continue;
    } else {
      folderList.value.add(path);
    }
  }

  folderList.value
      .sort((a, b) => a.split("/").last.compareTo(b.split("/").last));
}

createFolderView() {
  clearFolderList();
  folderBuilder();
}
