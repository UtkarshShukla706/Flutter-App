import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newpro1/pages/home.dart';
import 'package:newpro1/pages/signup.dart';
import 'package:newpro1/services/database.dart';
import 'package:newpro1/services/share_pref.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "", password = "", name = "", pic = "", username = "", id = "";
  TextEditingController useremailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();
  bool agreeToTerms = false;

  final _formkey = GlobalKey<FormState>();
   bool _obscurePassword = true;
  

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      QuerySnapshot querySnapshot = await DatabaseMethods().getUserbyemail(
        email,
      );

      if (querySnapshot.docs.isNotEmpty) {
        
        name = '${querySnapshot.docs[0]['Name']}';
        username = '${querySnapshot.docs[0]['username']}';
        pic = '${querySnapshot.docs[0]['PhotoUrl']}';
        id = querySnapshot.docs[0].id;

        await SharedPreferencesHelper().saveUserDisplayName(name);
        await SharedPreferencesHelper().saveUserEmail(email);
        await SharedPreferencesHelper().saveUserPic(pic);
        await SharedPreferencesHelper().saveUserName(username);
        await SharedPreferencesHelper().saveUserId(id);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        // Handle the case where no user data is found in Firestore for the given email
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('User data not found.')));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found for that email.')),
        );
      } else if (e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong password provided for that user.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      //  backgroundColor: Color.fromARGB(255, 0, 1, 7),
      body: SingleChildScrollView(

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Chat, Connect, Cherish - Your AI Awaits.',
                        style: TextStyle(
                          color: Color(0xFFB0B0B0),
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0), // Adjusted spacing
                    // --- STRUCTURAL CHANGE STARTS HERE ---
                    // Simplified the main form container structure.
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30.0,
                        horizontal: 20.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1F3A),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: const Color(0xFF2A2F4A),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xFF252A42),
                              ),
                              child: TextFormField(
                                controller: useremailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Input your email',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF5A5F7A),
                                    fontSize: 14.0,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color:  Color(0xFFE8FF00),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            const Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: const Color(0xFF2A2F4A),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xFF252A42),
                              ),
                              child: TextFormField(
                                controller: userpasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your password',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF5A5F7A),
                                    fontSize: 14.0,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Color(0xFFE8FF00),
                                    size: 20.0,
                                  ),
                                  suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                                  
                                ),
                                obscureText: _obscurePassword,
                              ),
                            ),
                            const SizedBox(height: 45.0),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = useremailController.text;
                                      password = userpasswordController.text;
                                    });
                                    userLogin();
                                  }
                                },
                                // Simplified button structure
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8FF00),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Color(0xFF0A0E27),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            const Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Color(0xFF2A2F4A),
                                    thickness: 1.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Text(
                                    'Or continue with',
                                    style: TextStyle(
                                      color: Color(0xFF808080),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Color(0xFF2A2F4A),
                                    thickness: 1.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  // Google sign in logic
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF252A42),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: const Color(0xFF2A2F4A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4.0),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFE8FF00),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Text(
                                          'G',
                                          style: TextStyle(
                                            color: Color(0xFF0A0E27),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12.0),
                                      const Text(
                                        'Continue with Google',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  // Facebook sign in logic
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF252A42),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: const Color(0xFF2A2F4A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4.0),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFE8FF00),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Text(
                                          'f',
                                          style: TextStyle(
                                            color: Color(0xFF0A0E27),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12.0),
                                      const Text(
                                        'Continue with Facebook',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Color(0xFFB0B0B0),
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
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xFFE8FF00),
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
