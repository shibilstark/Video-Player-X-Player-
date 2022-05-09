import 'package:permission_handler/permission_handler.dart';

Future<bool> askPermission() async {
  if (await _requestPermission(Permission.storage)) {
    return true;
  } else {
    
    return false;
  }
}

Future<bool> _requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}
