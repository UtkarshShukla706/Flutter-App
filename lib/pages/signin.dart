import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      // CHANGE 1: Wrapped the body in a SingleChildScrollView to prevent overflow.
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF7f30fe), Color(0xFF6380fb)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width,
                      105.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'SignIn',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Login to your account',
                        style: TextStyle(
                          color: Color(0xFFbbb0ff),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // CHANGE 2: Removed the Flexible widget for more natural positioning.
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 30.0,
                            horizontal: 20.0,
                          ),
                          // CHANGE 3: Removed fixed height to make the card responsive to its content.
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.black38,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.mail_outline,
                                      color: Color(0xFF7f30fe),
                                    ),
                                  ),
                                ),
                              ),
                              // CHANGE 5: Adjusted spacing to better match the UI image.
                              SizedBox(height: 20.0),
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.black38,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Color(0xFF7f30fe),
                                    ),
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              // CHANGE 4: Replaced Spacer with SizedBox for consistent spacing.
                              SizedBox(height: 50.0),
                              Center(
                                child: Container(
                                 
                                  width: 120,
                                  child: Material(
                                    elevation: 5.0,
                                    // Change Made: Increased borderRadius for a more rounded, pill-like shape
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Container(
                                      // Change Made: Increased vertical padding for a taller, more prominent button
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF6380fb),
                                        // Change Made: Matched the borderRadius to the Material widget
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), 
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0), // Adjusted spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              color:
                                  isDarkMode ? Colors.white : Colors.black54,
                              fontSize: 16.0),
                        ),
                        Text(
                          ' SignUp Now!',
                          style: TextStyle(
                            color: Color(0xFF7f30fe),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0), // Added padding at the bottom
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}