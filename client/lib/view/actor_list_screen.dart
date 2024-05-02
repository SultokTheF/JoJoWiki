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
        title: Text('List of Actors'),
      ),
      drawer: JoJoDrawer(),
      body: ListView(
        children: actorList.map((actor) => ListTile(title: Text(actor.name))).toList(),
      ),
    );
  }
}
