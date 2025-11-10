import 'package:flutter/material.dart';
import 'package:newpro1/pages/coverpage.dart';
class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 25, 25),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Coverpage())),
        ),
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our App Terms & Conditions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Not everyone knows how to make a Privacy Policy agreement, especially with CCPA or GDPR or CaLOPPA or PIPEDA or Australia\'s Privacy Act provisions. If you are not a lawyer or someone who is familiar to Privacy Policies, you will be clueless. Some people might even take advantage of you because of this. Some people may even extort money from you. These are some examples that we want to stop from happening to you.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14.0,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'We will help you protect yourself by generating a Privacy Policy.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Our Privacy Policy Generator can help you make sure that your business complies with the law. We are here to help you protect your business, yourself and your customers.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14.0,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Fill in the blank spaces below and we will create a personalized website Privacy Policy for your business. No account registration required. Simply generate & download a Privacy Policy in seconds!',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}