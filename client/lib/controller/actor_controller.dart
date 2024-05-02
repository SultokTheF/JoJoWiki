import '../model/actor.dart';

class ActorController {
  Actor getFeaturedActor() {
    return Actor(
      'Jotaro Kujo',
      'Season 3: Stardust Crusaders',
      28,
      'Jotaro Kujo is a fictional character from JoJo\'s Bizarre Adventure. He is the protagonist of Part 3: Stardust Crusaders.',
      'assets/actors/jotaro kujo.png',
      'ORA ORA ORA!',
    );
  }

  List<Actor> getActorList() {
    return [
      Actor(
        'Jonathan Joestar',
        '1',
        20,
        'Jonathan Joestar, the protagonist of Part 1: Phantom Blood, is a brave and honorable young man from the Joestar family. He possesses a strong sense of justice and a noble spirit, making him a natural leader.',
        'assets/actors/jonathan joestar.png',
        'The epitome of gentlemanly honor.'
      ),
      Actor(
        'Joseph Joestar',
        '1,2,3,4',
        30,
        'Joseph Joestar, known for his appearances in Part 2: Battle Tendency and subsequent parts, is a clever and resourceful fighter. His quick thinking and ability to outsmart opponents make him a formidable Stand user.',
        'assets/actors/joseph joestar.png',
        'Your next line will be...'
      ),
      Actor(
        'Jotaro Kujo',
        '2,3,4,6',
        17,
        'Jotaro Kujo, the iconic protagonist of Part 3: Stardust Crusaders and later parts, is a stoic and powerful Stand user. His Stand, Star Platinum, showcases incredible strength and precision.',
        'assets/actors/jotaro kujo.png',
        'Yare yare daze.'
      ),
      Actor(
        'Josuke Higashikata',
        '4',
        16,
        'Josuke Higashikata, the main character of Part 4: Diamond is Unbreakable, is known for his kind-hearted nature and loyalty to his friends. His Stand, Crazy Diamond, can repair almost anything.',
        'assets/actors/josuke higashikata.png',
        "I'll fix that for you."
      ),
      Actor(
        'Giorno Giovanna',
        '5',
        15,
        'Giorno Giovanna, the protagonist of Part 5: Golden Wind, is a charismatic and ambitious leader. His Stand, Gold Experience, grants him the ability to create life from inanimate objects.',
        'assets/actors/giorno giovanna.png',
        'I, Giorno Giovanna, have a dream.'
      ),
      Actor(
        'Jolyne Cujoh',
        '6',
        19,
        'Jolyne Cujoh, the main character of Part 6: Stone Ocean, is a determined and resilient fighter. Despite facing numerous challenges, she demonstrates unwavering courage and strength.',
        'assets/actors/jolyne cujoh.png',
        'Do you understand the gravity of your situation?'
      ),
    ];
  }
}
