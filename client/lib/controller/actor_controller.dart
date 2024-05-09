import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/actor.dart';

class ActorController {
  Future<List<Actor>> getActorList() async {
    final response = await http.get(Uri.parse('http://localhost:8080/actors/'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Actor> actorList = jsonResponse.map((model) => Actor.fromJson(model)).toList();
      return actorList;
    } else {
      throw Exception('Failed to load actors');
    }
  }

  // You can optionally implement a method to fetch a featured actor as well.
}
