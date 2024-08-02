import 'package:hive/hive.dart';

class HiveService {
  final appBox = Hive.box<String>("endpoints");

  writeEndPoint(String local) {
    appBox.put("endPoint", local);
  }

  deleteEndPoint() {
    appBox.delete("endPoint");
  }

  String? getEndPoint() {
    return appBox.get('endPoint');
  }
}
