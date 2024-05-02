import '../model/actor.dart';

class ActorController {
  List<Actor> getActorList() {
    return [
      Actor('Jonathan Jostar', '1'),
      Actor('Joseph Jostar', '1,2,3,4'),
      Actor('Jotaro Kujo', '2,3,4,6'),
      Actor('Josuke Higashikava', '4'),
      Actor('Giorno Giovanna', '5'),
      Actor('Jolyne Cujoh', '6'),
    ];
  }
}
