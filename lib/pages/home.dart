import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:newpro1/pages/bot_details.dart';
import 'package:newpro1/pages/stat_page.dart';

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
        "title": "Sofi",
        "subtitles": "Sweet, lovable, girlfriend-type personality",
        "image": 'images/sofi.png',
      },
      {
        "color": const Color.fromARGB(255, 126, 89, 228),
        "title": "Momo",
        "subtitles": "Shy, clumsy, energetic, motivational, lovable",
        "image": 'images/momo.png',
      },
      {
        "color": Colors.pinkAccent,
        "title": "Arin",
        "subtitles": "Intelligent, handsome, brother-like advisor",
        "image": 'images/arin.png',
      },
      {
        "color": const Color.fromARGB(255, 2, 101, 182),
        "title": "Blade",
        "subtitles": "Martial artist, self-defence expert",
        "image": 'images/blade.png',
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
          // Container(
          //   margin: const EdgeInsets.only(right: 16.0),
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 12.0,
          //     vertical: 6.0,
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //     borderRadius: BorderRadius.circular(20.0),
          //   ),
          //   child: const Row(
          //     children: [
          //       Icon(Icons.star, color: Colors.white, size: 16.0),
          //       SizedBox(width: 4.0),
          //       Text(
          //         "Pro",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 28,
            ),

            color: const Color(0xFF1F2442),
            onSelected: (value) {
              switch (value) {
                case 'dashboard':
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => StatsPage()),
                  );
                  break;
                // case 'history':
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(builder: (context) => StatsPage()),
                //   );
                //   break;
                case 'settings':
                  break;
                case 'logout':
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'dashboard',
                child: Row(
                  children: [
                    Icon(Icons.dashboard, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Dashboard', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              // const PopupMenuItem<String>(
              //   value: 'history',
              //   child: Row(
              //     children: [
              //       Icon(Icons.history, color: Colors.white),
              //       SizedBox(width: 10),
              //       Text('History', style: TextStyle(color: Colors.white)),
              //     ],
              //   ),
              // ),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Settings', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.redAccent,
                    ), // Red to indicate exit
                    SizedBox(width: 10),
                    Text('Log Out', style: TextStyle(color: Colors.redAccent)),
                  ],
                ),
              ),
            ],
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {},
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.deepPurpleAccent,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ),
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 20.0,
              //           vertical: 10.0,
              //         ),
              //       ),
              //       child: const Row(
              //         children: [
              //           Icon(Icons.chat_bubble, color: Colors.white),
              //           SizedBox(width: 8.0),
              //           Text("Chat", style: TextStyle(color: Colors.white)),
              //         ],
              //       ),
              //     ),
              //     OutlinedButton(
              //       onPressed: () {
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(builder: (context) => StatsPage()),
              //         );
              //       },
              //       style: OutlinedButton.styleFrom(
              //         side: const BorderSide(color: Colors.grey),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ),
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 20.0,
              //           vertical: 10.0,
              //         ),
              //       ),
              //       child: const Row(
              //         children: [
              //           Icon(Icons.history, color: Colors.white),
              //           SizedBox(width: 8.0),
              //           Text("History", style: TextStyle(color: Colors.white)),
              //         ],
              //       ),
              //     ),
              //     OutlinedButton(
              //       onPressed: () {},
              //       style: OutlinedButton.styleFrom(
              //         side: const BorderSide(color: Colors.grey),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ),
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 20.0,
              //           vertical: 10.0,
              //         ),
              //       ),
              //       child: const Row(
              //         children: [
              //           Icon(Icons.settings, color: Colors.white),
              //           SizedBox(width: 8.0),
              //           Text("Setting", style: TextStyle(color: Colors.white)),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),

              //  Text(
              //   "Good Morning, User 👋",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 22.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(height: 6),

              //  Text(
              //   "Who would you like to talk to today?",
              //   style: TextStyle(color: Colors.white70, fontSize: 16.0),
              // ),
              TweenAnimationBuilder<double>(
                duration: Duration(seconds: 2),
                tween: Tween(begin: 0, end: 1),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  final bounce = Curves.elasticOut.transform(value);
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      // offset: Offset(50 * (1 - value), 0),
                      offset: Offset(50 * (1 - bounce), 0),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8FF00),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(1),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.25), 
                        blurRadius: 12,
                        spreadRadius: 1, 
                        offset: Offset(0, 6), 
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        repeatForever: false,
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            "Good Day , User 👋",
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: Duration(milliseconds: 90),
                          ),
                        ],
                      ),

                      SizedBox(height: 6),

                      AnimatedTextKit(
                        repeatForever: false,
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            "Who would you like to talk to today?",
                            textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                            speed: Duration(milliseconds: 70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

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

              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.60,
                ),
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildSuggestionCard(
                    color: suggestions[index]["color"] as Color,
                    title: suggestions[index]["title"] as String,
                    subtitle: suggestions[index]["subtitles"] as String,
                    imagePath: suggestions[index]["image"] as String,
                  );
                },
              ),
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BotDetails(
                backgroundColor: color,
                imagePath: imagePath,
                title: title,
                subtitle: subtitle,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    title,

                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),

                  // Subtitle takes all remaining space safely
                  Expanded(
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Image ALWAYS fits — NEVER overflows
                  Expanded(
                    child: SizedBox(
                      height: 250,

                      // height: constraints.maxHeight * 0.22, // 22% of card height
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                        height: 125.0,
                        alignment: AlignmentGeometry.bottomCenter,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
