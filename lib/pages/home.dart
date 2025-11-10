import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E27),
        title: const Text(
          "Chat AI",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 16.0,
                ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Changed for better spacing
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      // Reduced horizontal padding to prevent overflow
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
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
                      // Reduced horizontal padding
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
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
                      // Reduced horizontal padding
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Suggestions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: const Text(
                  //     "View all",
                  //     style: TextStyle(color: Colors.amber),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildSuggestionCard(
                      color: Colors.orange,
                      title: "Write an UI/UX design",
                      subtitle:
                          "Lorem Ipsum is simply dummy text of the printing and",
                      imagePath: 'assets/suggestion1.png',
                    ),
                    const SizedBox(width: 16.0),
                    _buildSuggestionCard(
                      color: Colors.deepPurpleAccent,
                      title: "Write an Article",
                      subtitle:
                          "Lorem Ipsum is simply dummy text of the printing and",
                      imagePath: 'assets/suggestion2.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
               SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildSuggestionCard(
                      color: Colors.orange,
                      title: "Write an UI/UX design",
                      subtitle:
                          "Lorem Ipsum is simply dummy text of the printing and",
                      imagePath: 'assets/suggestion1.png',
                    ),
                    const SizedBox(width: 16.0),
                    _buildSuggestionCard(
                      color: Colors.deepPurpleAccent,
                      title: "Write an Article",
                      subtitle:
                          "Lorem Ipsum is simply dummy text of the printing and",
                      imagePath: 'assets/suggestion2.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
               SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildSuggestionCard(
                      color: Colors.orange,
                      title: "Write an UI/UX design",
                      subtitle:
                          "Lorem Ipsum is simply dummy text of the printing and",
                      imagePath: 'assets/suggestion1.png',
                    ),
                    const SizedBox(width: 16.0),
                    _buildSuggestionCard(
                      color: Colors.deepPurpleAccent,
                      title: "Write an Article",
                      subtitle:
                          "Lorem Ipsum is simply dummy text of the printing and",
                      imagePath: 'assets/suggestion2.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
               SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildSuggestionCard(
                      color: Colors.orange,
                      title: "Write an UI/UX design",
                      subtitle:
                          "Lorem Ipsum is simply dummy text of the printing and",
                      imagePath: 'assets/suggestion1.png',
                    ),
                    const SizedBox(width: 16.0),
                    _buildSuggestionCard(
                      color: Colors.deepPurpleAccent,
                      title: "Write an Article",
                      subtitle:
                          "Lorem Ipsum is simply dummy text of the printing and",
                      imagePath: 'assets/suggestion2.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),

              // Prompt Library Section
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       "Prompt library",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20.0,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     TextButton(
              //       onPressed: () {},
              //       child: const Text(
              //         "View all",
              //         style: TextStyle(color: Colors.amber),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 16.0),
              // Wrap(
              //   spacing: 12.0,
              //   runSpacing: 12.0,
              //   children: [
              //     _buildPromptChip("🎨 Graphic Design"),
              //     _buildPromptChip("⚡ Midjourney"),
              //     _buildPromptChip("🖌️ UI/UX Design"),
              //     _buildPromptChip("😍 3D Arts"),
              //     _buildPromptChip("🚀 Seo"),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "You have 2 free message left. Get Premium",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ask ai chat anything",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFF1A1F3A),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.deepPurpleAccent,
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ],
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
      width: 150,
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
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12.0,
            ),
          ),
          
          Align(
            alignment: Alignment.bottomRight,
            child: Image.network('https://placehold.co/100x60',
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  // Widget _buildPromptChip(String label) {
  //   return Chip(
  //     label: Text(label, style: const TextStyle(color: Colors.white)),
  //     backgroundColor: const Color(0xFF1A1F3A),
  //     padding: const EdgeInsets.symmetric( vertical: 12.0),
  //   );
  // }
}