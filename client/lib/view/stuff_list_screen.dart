import 'package:flutter/material.dart';
import '../controller/stuff_controller.dart';
import '../model/stuff.dart';
import '../view/jojo_drawer.dart';
import 'stuff_details_screen.dart'; // Import the StuffDetailsScreen

class StuffListScreen extends StatefulWidget {
  StuffListScreen({Key? key}) : super(key: key);

  @override
  _StuffListScreenState createState() => _StuffListScreenState();
}

class _StuffListScreenState extends State<StuffListScreen> {
  final StuffController _stuffController = StuffController();
  late Future<List<Stuff>> _stuffListFuture;

  @override
  void initState() {
    super.initState();
    _stuffListFuture = _stuffController.fetchStuffList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NPC Stuff',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'JoJoFont',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const JoJoDrawer(),
      body: FutureBuilder<List<Stuff>>(
        future: _stuffListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Stuff> stuffList = snapshot.data ?? [];
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: stuffList.length,
              itemBuilder: (context, index) {
                Stuff stuff = stuffList[index];
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
                              stuff.imageUrl,
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
                              stuff.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              stuff.role,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StuffDetailsScreen(stuff: stuff),
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
            );
          }
        },
      ),
    );
  }
}
