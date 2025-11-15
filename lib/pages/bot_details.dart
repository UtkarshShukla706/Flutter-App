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
            SizedBox(height: 48.0),

              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF0A0E27), backgroundColor: const Color(0xFFE8FF00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 25.0,horizontal: 30.0),
                ),
                onPressed: () {
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}