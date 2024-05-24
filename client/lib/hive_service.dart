import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:client/model/news.dart';

class HiveService {
  static initHive() async {
    final applicationDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(NewsAdapter());
  }
}
