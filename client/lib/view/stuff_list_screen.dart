import 'package:flutter/material.dart';
import '../controller/stuff_controller.dart';
import '../model/stuff.dart';
import '../view/jojo_drawer.dart';

class StuffListScreen extends StatelessWidget {
  final StuffController _stuffController = StuffController();

  @override
  Widget build(BuildContext context) {
    List<Stuff> stuffList = _stuffController.getStuffList();

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Stuff'),
      ),
      drawer: JoJoDrawer(),
      body: ListView(
        children: stuffList.map((stuff) => ListTile(title: Text(stuff.name))).toList(),
      ),
    );
  }
}
