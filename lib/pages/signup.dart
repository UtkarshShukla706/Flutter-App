import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newpro1/pages/home.dart';
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

   registration() async {
    // ignore: unnecessary_null_comparison
    if (password!=null &&password == confirmpassword) {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
           String id=randomAlphaNumeric(10);
        
        Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "Email": emailcontroller.text,
          "username":emailcontroller.text.replaceAll("@gmail.com",""),
          "PhotoUrl":"https://www.hiclipart.com/free-transparent-background-png-clipart-pfjjr",
          "id":id
        };
        await DatabaseMethods().addUserDetails(userInfoMap, id);
        await SharedPreferencesHelper().saveUserId(id);
        await SharedPreferencesHelper().saveUserDisplayName(namecontroller.text);
        await SharedPreferencesHelper().saveUserEmail(emailcontroller.text);
        await SharedPreferencesHelper().saveUserPic("https://www.hiclipart.com/free-transparent-background-png-clipart-pfjjr");
        await SharedPreferencesHelper().saveUserName(emailcontroller.text.replaceAll("@gmail.com",""));


        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Account Created Successfully..",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home()));


       
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
      body: SingleChildScrollView(
        child: SizedBox(
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
                        'SignUp',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Create a new account',
                        style: TextStyle(
                          color: Color(0xFFbbb0ff),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
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
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
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
                                  child: TextFormField(
                                    controller: namecontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Provide Your Name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.people_outline,
                                        color: Colors.deepPurple.shade300,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
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
                                  child: TextFormField(
                                    controller: emailcontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Provide your Email";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.mail_outline,
                                        color: Colors.deepPurple.shade300,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
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
                                  child: TextFormField(
                                    controller: passwordcontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter your Password";
                                      }
                                      return null;
                                    },
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
                                SizedBox(height: 10.0),
                                Text(
                                  'Confirm Password',
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
                                  child: TextFormField(
                                    controller: conpasswordcontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please confirm your Password";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.edit_outlined,
                                        color: Colors.deepPurple.shade300,
                                      ),
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account? ",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    GestureDetector(
                                      // Added GestureDetector to make "SignIn" tappable
                                      onTap: () {
                                        // Add navigation to SignIn page here
                                      },
                                      child: Text(
                                        'SignIn',
                                        style: TextStyle(
                                          color: Color(0xFF7f30fe),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        name = namecontroller.text;
                                        email = emailcontroller.text;
                                        password = passwordcontroller.text;
                                        confirmpassword =
                                            conpasswordcontroller.text;
                                      });
                                      registration();
                                    }
                                  },
                                  child: Center(
                                    child: SizedBox(
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
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Submit',
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
