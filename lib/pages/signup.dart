import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A Stack is used to layer the decorative header behind the form.
      body: Stack(
        children: [
          // The background gradient widget.
          _Header(),
          // The main content, which is scrollable to prevent overflows.
          _SignUpForm(),
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
      // Responsive height based on screen size.
      height: MediaQuery.of(context).size.height * 0.3,
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

/// A private widget for the main sign-up form and its related content.
class _SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView is essential to prevent overflow errors when the
    // keyboard appears or on devices with smaller screens.
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            const Text(
              'SignUp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Create a new account',
              style: TextStyle(
                color: Color(0xFFbbb0ff),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40.0),

            // The main form card.
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                // NOTE: The fixed height has been removed to make the card
                // responsive to its content's size.
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(label: 'Name', icon: Icons.person_outline),
                    const SizedBox(height: 20.0),
                    _buildTextField(label: 'Email', icon: Icons.mail_outline),
                    const SizedBox(height: 20.0),
                    _buildTextField(label: 'Password', icon: Icons.password, isObscure: true),
                    const SizedBox(height: 20.0),
                    _buildTextField(label: 'Confirm Password', icon: Icons.edit_outlined, isObscure: true),
                    const SizedBox(height: 40.0),
                    
                    // The primary action button.
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle sign-up logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6380fb),
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'SignUp',
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
            const SizedBox(height: 30.0),
            
            // The secondary action link to the sign-in page.
            Text.rich(
              TextSpan(
                text: "Already have an account? ",
                style: const TextStyle(color: Colors.black54, fontSize: 16.0),
                children: const [
                  TextSpan(
                    text: 'SignIn Now!',
                    style: TextStyle(
                      color: Color(0xFF7f30fe),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                    // Add a recognizer for tap events later.
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0), // Padding at the bottom
          ],
        ),
      ),
    );
  }

  /// A helper method to build a text field, reducing code duplication.
  Widget _buildTextField({required String label, required IconData icon, bool isObscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
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
              prefixIcon: Icon(icon, color: Colors.deepPurple.shade300),
            ),
            obscureText: isObscure,
          ),
        ),
      ],
    );
  }
}