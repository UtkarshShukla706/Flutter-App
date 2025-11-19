import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:newpro1/pages/home.dart';


class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int touchedIndex = -1; 

 
  final List<Color> _colors = [
    const Color(0xFFE8FF00), 
    Colors.blueAccent,
    Colors.redAccent,
    Colors.purpleAccent,
   
  ];

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27), 
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=> Home())
          ),
        ),
        backgroundColor: const Color(0xFF0A0E27),
        title: const Text("Personality Ranking", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('stats')
            .orderBy('count', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFE8FF00)));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.bar_chart, size: 60, color: Colors.grey),
                  SizedBox(height: 10),
                  Text("No stats yet. Start chatting!", style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          final docs = snapshot.data!.docs;
          
          
          int totalMessages = 0;
          for (var doc in docs) {
            totalMessages += (doc['count'] as num).toInt();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                const Text("Most Used Chatbots", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                SizedBox(
                  height: 250,
                  child: PieChart(
                    PieChartData(
                      // pieTouchData: PieTouchData(
                      //   touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      //     setState(() {
                      //       if (!event.isInterestedForInteractions ||
                      //           pieTouchResponse == null ||
                      //           pieTouchResponse.touchedSection == null) {
                      //         touchedIndex = -1;
                      //         return;
                      //       }
                      //       touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      //     });
                      //   },
                      // ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                      sections: List.generate(docs.length, (i) {
                        final data = docs[i].data() as Map<String, dynamic>;
                        final count = (data['count'] as num).toInt();
                        final percentage = (count / totalMessages) * 100;
                        
                        final isTouched = i == touchedIndex;
                        final fontSize = isTouched ? 20.0 : 14.0;
                        final radius = isTouched ? 110.0 : 100.0;
                        final color = _colors[i % _colors.length];

                        return PieChartSectionData(
                          color: color,
                          value: count.toDouble(),
                          title: '${percentage.toStringAsFixed(0)}%',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0A0E27), 
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),

               
                const Text("Rankings", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    final name = (data['botName'] as String? ?? "Unknown");
                    final imagePath = (data['botImage'] as String? ?? "");
                    final count = (data['count'] as num).toInt();
                    final color = _colors[index % _colors.length];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1F3A),
                        borderRadius: BorderRadius.circular(12),
                        // ignore: deprecated_member_use
                        border: Border.all(color: color.withOpacity(0.5), width: 1),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: color,
                          // Check if image is Asset or Network (just in case)
                          backgroundImage: imagePath.startsWith('http') 
                              ? NetworkImage(imagePath) 
                              : AssetImage(imagePath) as ImageProvider,
                        ),
                        title: Text(
                          name.toUpperCase(), // Or use .toTitleCase() if you import your extension
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Rank #${index + 1}",
                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "$count msgs",
                            style: const TextStyle(
                              color: Color(0xFF0A0E27), 
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}