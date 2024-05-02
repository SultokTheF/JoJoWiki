import 'package:flutter/material.dart';
import '../controller/actor_controller.dart';
import '../model/actor.dart';
import '../view/jojo_drawer.dart';

class ActorListScreen extends StatelessWidget {
  final ActorController _actorController = ActorController();

  @override
  Widget build(BuildContext context) {
    List<Actor> actorList = _actorController.getActorList();

    return Scaffold(
      appBar: AppBar(
        title: Text('JoJo Main Actors'),
      ),
      drawer: JoJoDrawer(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two cards per row
          childAspectRatio: 0.75, // Aspect ratio for the cards
        ),
        itemCount: actorList.length,
        itemBuilder: (context, index) {
          Actor actor = actorList[index];
          return Card(
            elevation: 4, // Add elevation for a shadow effect
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 161, // Increased height of the Card by 11 pixels
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.asset(
                        'assets/actors/${actor.name.toLowerCase()}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        actor.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Seasons: ${actor.season}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to more details screen or show a dialog with more details
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.blue.shade500),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 15), 
                    ),
                  ),
                  child: Text('More Details ->'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
