import '../model/stuff.dart';

class StuffController {
  List<Stuff> getStuffList() {
    return [
      Stuff(
        'Samsa Nurai',
        20,
        'UI/UX Designer',
        'As a UI/UX Designer, Samsa Nurai brings innovative design concepts and user-friendly interfaces to our projects, enhancing the overall user experience.',
        'assets/stuff/nurai.jpg',
      ),
      Stuff(
        'Nurym Abzal',
        19,
        'Models Designer',
        "Nurym Abzal's expertise as a Models Designer ensures that our projects have robust and efficient data models, contributing to seamless functionality and performance.",
        'assets/stuff/askar.jpg',
      ),
      Stuff(
        'Sultok Sultaniyar',
        19,
        'Views Designer',
        'Sultok Sultaniyar is a Views Designer who crafts visually appealing and responsive layouts, making our applications visually engaging and accessible to users.',
        'assets/stuff/sultaniyar.jpg',
      ),
      Stuff(
        'SanzharTheF',
        19,
        'Controllers Designer',
        'SanzharTheF excels as a Controllers Designer, implementing logical and structured control flows that ensure the smooth operation and functionality of our applications.',
        'assets/stuff/sanzhar.jpg',
      ),
    ];
  }
}
