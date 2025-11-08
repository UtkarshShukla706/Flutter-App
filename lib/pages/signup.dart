import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:newpro1/pages/signin.dart';
import 'package:newpro1/services/database.dart';
import 'package:newpro1/services/share_pref.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "", confirmpassword = "";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conpasswordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  registration() async {
    // ignore: unnecessary_null_comparison
    if (password != null && password == confirmpassword) {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String id = randomAlphaNumeric(10);

        Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "Email": emailcontroller.text,
          "username": emailcontroller.text.replaceAll("@gmail.com", ""),
          "PhotoUrl":
              "https://www.hiclipart.com/free-transparent-background-png-clipart-pfjjr",
          "id": id,
        };
        await DatabaseMethods().addUserDetails(userInfoMap, id);
        await SharedPreferencesHelper().saveUserId(id);
        await SharedPreferencesHelper().saveUserDisplayName(
          namecontroller.text,
        );
        await SharedPreferencesHelper().saveUserEmail(emailcontroller.text);
        await SharedPreferencesHelper().saveUserPic(
          "https://www.hiclipart.com/free-transparent-background-png-clipart-pfjjr",
        );
        await SharedPreferencesHelper().saveUserName(
          emailcontroller.text.replaceAll("@gmail.com", ""),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Account Created Successfully..",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Password is Too Weak..",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Email is already in the use..",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E27), // Dark navy background
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Center(
                  child: Column(
                  children: [
                    Text(
                    "Let's Get Started!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
                      children: [
                      TextSpan(
                        text: "Create your account and start chatting with your AI assistants.",
                      ),
                      ],
                    ),
                    ),
                  ],
                  ),
                ),
                SizedBox(height: 30.0),

                // Form Container
                Container(
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8FF3B), // Bright yellow/lime
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Name Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: TextFormField(
                            controller: namecontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Provide Your Name";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14.0,
                              ),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 16.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),

                        // Email Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: TextFormField(
                            controller: emailcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Provide your Email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14.0,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 16.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),

                        // Password Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: TextFormField(
                            controller: passwordcontroller,
                            obscureText: _obscurePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter your Password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14.0,
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.black,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 16.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),

                        // Confirm Password Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: TextFormField(
                            controller: conpasswordcontroller,
                            obscureText: _obscureConfirmPassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please confirm your Password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Confirm your password',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14.0,
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.black,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 16.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),

                        // Remember Me & Forgot Password Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add forgot password logic
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Color(0xFF0A0E27),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.0),

                        // Sign In Button
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  name = namecontroller.text;
                                  email = emailcontroller.text;
                                  password = passwordcontroller.text;
                                  confirmpassword = conpasswordcontroller.text;
                                });
                                registration();
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              decoration: BoxDecoration(
                                color: Color(0xFF0A0E27),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),

                        // Already have account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: Color(0xFF0A0E27),
                                fontSize: 14.0,
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Color(0xFF0A0E27),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),

                        // Divider with "Or continue with"
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Color(0xFF0A0E27),
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(
                                  color: Color(0xFF0A0E27),
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Color(0xFF0A0E27),
                                thickness: 1.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),

                        // Social Login Buttons
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF0A0E27),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.g_mobiledata,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Google',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF0A0E27),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.facebook,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Facebook',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),

                        // Terms and Privacy
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Terms of Service action
                              },
                              child: Text(
                                'Terms of Service',
                                style: TextStyle(
                                  color: Color(0xFF0A0E27),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            SizedBox(width: 24.0),
                            GestureDetector(
                              onTap: () {
                                // Privacy Policy action
                              },
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  color: Color(0xFF0A0E27),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
