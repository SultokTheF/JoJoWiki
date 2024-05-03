import 'package:flutter/material.dart';
import '../controller/actor_controller.dart';
import '../model/actor.dart';
import '../view/jojo_drawer.dart';
import 'actor_details_screen.dart'; // Import the ActorDetailsScreen

class ActorListScreen extends StatelessWidget {
  final ActorController _actorController = ActorController();

  ActorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Actor> actorList = _actorController.getActorList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Actors',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'JoJoFont',
            fontWeight: FontWeight.bold,
          )
        ),
      ),
      drawer: const JoJoDrawer(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: actorList.length,
        itemBuilder: (context, index) {
          Actor actor = actorList[index];
          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 161,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.asset(
                        actor.imageUrl,
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'JoJoFont',
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActorDetailsScreen(actor: actor),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.blue.shade500),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontSize: 15),
                    ),
                  ),
                  child: const Text('More Details ->'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
