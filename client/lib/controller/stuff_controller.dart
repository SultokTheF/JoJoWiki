import '../model/stuff.dart';

class StuffController {
  List<Stuff> getStuffList() {
    return [
      Stuff('Item 1'),
      Stuff('Item 2'),
      Stuff('Item 3'),
    ];
  }
}