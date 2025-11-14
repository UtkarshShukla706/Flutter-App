import 'package:flutter/material.dart';
import 'package:newpro1/pages/home.dart';

class BotDetails extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final String title;
  final String subtitle;
  

  const BotDetails({
    super.key,
    required this.backgroundColor,
    required this.imagePath,
    required this.title,
    required this.subtitle
   
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>Home())
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 40),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                ),
              ),
            ),
            // ElevatedButton(onPressed: onPressed, child: child)
          ],
        ),
      ),
    );
  }
}