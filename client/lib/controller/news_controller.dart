import '../model/news.dart';

class NewsController {
  List<News> getNewsList() {
    return [
      News('News 1'),
      News('News 2'),
      News('News 3'),
    ];
  }
}