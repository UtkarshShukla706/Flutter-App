import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    // The Scaffold provides the basic app layout structure.
    return Scaffold(
      // A Stack is used to place the decorative header behind the login form.
      body: Stack(
        children: [
          // The background gradient widget.
          _Header(),
          // The main content, which is scrollable to prevent overflows.
          _SignInForm(),
        ],
      ),
    );
  }
}

/// A private widget for the decorative curved header.
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // The height is responsive to the screen size.
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7f30fe), Color(0xFF6380fb)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // This creates the curved bottom edge.
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(MediaQuery.of(context).size.width, 105.0),
        ),
      ),
    );
  }
}

/// A private widget for the main sign-in form and related content.
class _SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // This makes the entire form area scrollable, which is essential
    // for preventing overflow errors on small screens or when the keyboard appears.
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            const Text(
              'SignIn',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Login to your account',
              style: TextStyle(
                color: Color(0xFFbbb0ff),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40.0),

            // The main login form card.
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                // NOTE: The fixed height has been removed. The container now
                // sizes itself based on its children, making it responsive.
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black38),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.deepPurple.shade300,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black38),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.deepPurple.shade300,
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle sign-in logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6380fb),
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'SignIn',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            
            
            Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: 16.0,
                ),
                children: const [
                  TextSpan(
                    text: 'SignUp Now!',
                    style: TextStyle(
                      color: Color(0xFF7f30fe),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                   
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0), 
          ],
        ),
      ),
    );
  }
}