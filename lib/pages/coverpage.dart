import 'package:flutter/material.dart';
import 'package:newpro1/pages/signin.dart';
import 'package:newpro1/pages/terms.dart';

class Coverpage extends StatefulWidget {
  const Coverpage({super.key});

  @override
  State<Coverpage> createState() => _CoverpageState();
}

class _CoverpageState extends State<Coverpage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       backgroundColor:Color.fromARGB(255, 26, 25, 25),
      body:SafeArea(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal:24.0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/cp2.png', 
                height: 300.0,
              ),
              SizedBox(height: 30.0),
               Text(
                'Welcome to AI chat bot',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),

              // 3. Subtitle Text
              Text(
                'World s most advanced AI chat bot to assist you in daily tasks and provide instant information.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16.0,
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 18.0),

              // 5. Terms & Conditions
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xFF0A0E27),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                ),
                onPressed: () {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Terms()));
                },
                child: Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        )
      )
    );
  }
}