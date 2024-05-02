import 'package:flutter/material.dart';
import '../controller/feature_controller.dart'; // Import the FeatureController
import '../controller/actor_controller.dart';
import '../controller/news_controller.dart';
import '../model/feature.dart'; // Import the Feature model
import '../model/actor.dart';
import '../model/news.dart';
import '../view/jojo_drawer.dart';

class MainScreen extends StatelessWidget {
  final FeatureController _featureController = FeatureController(); // Change to FeatureController
  final ActorController _actorController = ActorController();
  final NewsController _newsController = NewsController();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JoJo App'),
        backgroundColor: Colors.blue, // Change app bar color to blue
      ),
      drawer: const JoJoDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle('Project Features'),
            _buildFeaturesSection(),
            const SizedBox(height: 20),
            _buildSectionTitle('Featured Actor'),
            _buildFeaturedActorSection(),
            const SizedBox(height: 20),
            _buildSectionTitle('Latest News'),
            _buildLatestNewsSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // Add border to section title
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue, // Section title background color in blue
      ),
      padding: const EdgeInsets.all(12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Section title text color in white
        ),
      ),
    );
  }

  Widget _buildFeaturesSection() {
    List<Feature> features = _featureController.getFeaturesList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: features.map((feature) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1), // Add border to feature item
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(
                  feature.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  feature.name,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFeaturedActorSection() {
    Actor featuredActor = _actorController.getFeaturedActor();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // Add border to featured actor section
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue, // Featured actor section background color in blue
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Image.asset(
            featuredActor.imageUrl,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12),
          Text(
            featuredActor.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            featuredActor.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestNewsSection() {
    List<News> newsList = _newsController.getNewsList();

    return Column(
      children: newsList.map((news) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Add border radius to news cards
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                news.photoUrl,
                height: 150,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      news.mainText,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
