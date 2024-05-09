import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../view/jojo_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JoJo App',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'JoJoFont',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: const JoJoDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle('Project Features'),
            _buildFeaturesSection(),
            const SizedBox(height: 20),
            // Other sections can be added here
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      padding: const EdgeInsets.all(12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Text(
            'YouTube Video',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: 'EeCX8Y0a278', // YouTube video ID
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            ),
            showVideoProgressIndicator: true,
          ),
        ],
      ),
    );
  }

  
}
