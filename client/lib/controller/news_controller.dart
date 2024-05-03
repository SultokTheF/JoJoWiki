import '../model/news.dart';

class NewsController {
  List<News> getNewsList() {
    return [
      News(
        'AI Model for JoJoStyle Pictures',
        'assets/news/ai_model.jpg',
        'We are planning to integrate an AI model to generate JoJoStyle pictures in the future. Stay tuned for more updates!',
      ),
      News(
        'Welcome to Our New Team Member',
        'assets/news/new_member.jpg',
        'We are excited to announce a new member joining our team. Let\'s give to Asqar Nurym a warm welcome!',
      ),
      News(
        'JoJo’s Bizarre Adventure: Stone Ocean x Path to Nowhere',
        'assets/news/stone_ocean.png.webp',
        'The trailer and details for JoJo’s Bizarre Adventure: Stone Ocean x Path to Nowhere have been revealed. Explore the exciting new content!',
      ),
    ];
  }
}
