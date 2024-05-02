import '../model/feature.dart';

class FeatureController {
  List<Feature> getFeaturesList() {
    return [
      Feature(
        'AI-Powered Image Generator',
        'assets/features/ai_generator.png',
      ),
      Feature(
        'Team Collaboration Tools',
        'assets/features/collaboration_tools.png',
      ),
      Feature(
        'Real-time Notifications',
        'assets/features/notifications.png',
      ),
    ];
  }
}
