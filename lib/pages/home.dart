import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final suggestions = [
      {
        "color": Colors.orange,
        "title": "Write an UI/UX design",
        "image": 'images/cp2.png',
      },
      {
        "color": Colors.deepPurpleAccent,
        "title": "Write an Article",
        "image": 'images/cp2.png',
      },
      {
        "color": Colors.pinkAccent,
        "title": "Summarize a Topic",
        "image": 'images/cp2.png',
      },
      {
        "color": Colors.blue,
        "title": "Translate Language",
        "image": 'images/cp2.png',
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E27),
        title: const Text(
          " Chat AI",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 6.0,
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Row(
              children: [
                Icon(Icons.star, color: Colors.white, size: 16.0),
                SizedBox(width: 4.0),
                Text(
                  "Pro",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chat, History, Setting Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.chat_bubble, color: Colors.white),
                        SizedBox(width: 8.0),
                        Text("Chat", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.history, color: Colors.white),
                        SizedBox(width: 8.0),
                        Text("History", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.settings, color: Colors.white),
                        SizedBox(width: 8.0),
                        Text("Setting", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // Suggestions Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AI Suggestions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // --- MODIFICATION START: Replaced ListView with GridView ---
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildSuggestionCard(
                    color: suggestions[index]["color"] as Color,
                    title: suggestions[index]["title"] as String,
                    subtitle:
                        "Lorem Ipsum is simply dummy text of the printing and",
                    imagePath: suggestions[index]["image"] as String,
                  );
                },
              ),
              // --- MODIFICATION END ---
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionCard({
    required Color color,
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return Container(
      // width: 150, // <-- THIS LINE WAS REMOVED
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 12.0),
          ),
          const Spacer(), // Use Spacer to push the image to the bottom
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(imagePath, fit: BoxFit.cover,height: 50.0,),
          ),
        ],
      ),
    );
  }
}
