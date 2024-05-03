// Importing the 'stuff.dart' file which likely contains the definition of the Stuff class.
import '../model/stuff.dart';

// Defining a class called 'StuffController' which likely handles operations related to 'Stuff' objects.
class StuffController {
  // A method to retrieve a list of 'Stuff' objects.
  List<Stuff> getStuffList() {
    // Returning a list of 'Stuff' objects with detailed information about each staff member.
    return [
      // Creating a 'Stuff' object for Samsa Nurai.
      Stuff(
        'Samsa Nurai',
        20,
        'UI/UX Designer',
        'Samsa Nurai plays a vital role as a UI/UX Designer within the team. With a keen eye for innovation, Samsa introduces cutting-edge design concepts and implements user-friendly interfaces across our projects. Their focus on enhancing the overall user experience ensures that our applications are not only functional but also intuitive and engaging.',
        'assets/stuff/nurai.jpg',
      ),
      // Creating a 'Stuff' object for Nurym Asqar.
      Stuff(
        'Nurym Asqar',
        19,
        'Models Designer',
        'As a Models Designer, Nurym Asqar brings a wealth of expertise to the table. Their primary responsibility lies in crafting robust and efficient data models for our projects. Their meticulous approach ensures seamless functionality and optimal performance across various aspects of our applications.',
        'assets/stuff/askar.jpg',
      ),
      // Creating a 'Stuff' object for Sultok Sultaniyar.
      Stuff(
        'Sultok Sultaniyar',
        19,
        'Views Designer',
        'Sultok Sultaniyar is instrumental in shaping the visual identity of our applications. As a Views Designer, they specialize in creating visually appealing and responsive layouts. Their designs not only captivate users but also ensure accessibility, making our applications both aesthetically pleasing and user-friendly.',
        'assets/stuff/sultaniyar.jpg',
      ),
      // Creating a 'Stuff' object for SanzharTheF.
      Stuff(
        'SanzharTheF',
        19,
        'Controllers Designer',
        'SanzharTheF is the backbone of our application\'s functionality. In their role as a Controllers Designer, they excel in implementing logical and structured control flows. Their contributions guarantee the smooth operation and functionality of our applications, ensuring a seamless user experience.',
        'assets/stuff/sanzhar.jpg',
      ),
    ];
  }
}
