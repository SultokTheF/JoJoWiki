import '../model/actor.dart';

class ActorController {
  List<Actor> getActorList() {
    return [
      Actor('Actor 1'),
      Actor('Actor 2'),
      Actor('Actor 3'),
    ];
  }
}