import 'package:flutter/material.dart';

// The main screen of the application.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // The Scaffold provides the main layout structure.
    return Scaffold(
      // The background color of the screen, visible behind the white container.
      backgroundColor: const Color(0xFF553370),
      
      // Using a standard AppBar for the top section.
      appBar: AppBar(
        // The title of the app.
        title: const Text(
          "ChatUp",
          style: TextStyle(
            color: Color(0xffc199cd),
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Setting the AppBar color to match the design.
        backgroundColor: const Color(0xFF553370),
        // Removing the shadow below the AppBar for a flat design.
        elevation: 0,
        // Adding the search icon to the actions section of the AppBar.
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xff3a2144),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Icon(Icons.search, color: Color(0xffc199cd)),
            ),
          ),
        ],
      ),

      // The body of the Scaffold now contains the chat list.
      // It automatically fills the remaining screen space.
      body: const _ChatList(),
    );
  }
}

/// A widget for the white container that holds the scrollable chat list.
class _ChatList extends StatelessWidget {
  const _ChatList();

  @override
  Widget build(BuildContext context) {
    // This Container creates the white area with rounded top corners.
    // Because it's the Scaffold's body, it will fill all available space.
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      // ListView makes the chat list scrollable if there are many items.
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        children: const [
          // Reusable widgets for each chat item.
          _ChatItem(
            imagePath: "images/to.jpg",
            name: "Utkarsh Shukla",
            lastMessage: "Hello my name is ...",
            time: "04:30 PM",
          ),
          SizedBox(height: 20.0), // Spacing between chat items.
          _ChatItem(
            imagePath: "images/mo.jpg",
            name: "Ved Prakash",
            lastMessage: "How Are You ...",
            time: "04:30 PM",
          ),
        ],
      ),
    );
  }
}

/// A reusable widget for a single item in the chat list.
class _ChatItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String lastMessage;
  final String time;

  const _ChatItem({
    required this.imagePath,
    required this.name,
    required this.lastMessage,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30), // Circular border for the image
          child: Image.asset(
            imagePath,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10.0),
        // Using Expanded to make the column of text take up available space,
        // which helps the Spacer push the time to the edge correctly.
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                lastMessage,
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        // The time is aligned to the right.
        Text(
          time,
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}