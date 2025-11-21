import 'package:flutter/material.dart';
import 'package:newpro1/pages/home.dart';
import 'package:newpro1/pages/signin.dart';
import 'package:newpro1/services/database.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E27),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          ),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 10.0),
                child: Text(
                  "Support",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C2039),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("About Us Page")))));
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      leading: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF), // Purple
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF6C63FF),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.description,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      title: const Text(
                        "About us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),

                   
                    Divider(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.2),
                      height: 1,
                      indent: 70,
                      endIndent: 16,
                    ),

                    // 3. Privacy Policy
                    ListTile(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("Privacy Policy Page")))));
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      leading: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF5252), // Red
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFFF5252),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.verified_user,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      title: const Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),

                    // Divider
                    // ignore: deprecated_member_use
                    Divider(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.2),
                      height: 1,
                      indent: 70,
                      endIndent: 16,
                    ),

                    // 4. Term of use
                    ListTile(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("Term of Use Page")))));
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      leading: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50), // Green
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF4CAF50),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.article,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      title: const Text(
                        "Term of use",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),

                  
                    Divider(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.2),
                      height: 1,
                      indent: 70,
                      endIndent: 16,
                    ),

                   
                    ListTile(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("Language Page")))));
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      leading: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2196F3), // Blue
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF2196F3),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.language,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      title: const Text(
                        "Language",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 10.0),
                child: Text(
                  "Stay in touch",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C2039),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // 1. Rate App
                    ListTile(
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("Rate App Page")))));
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      leading: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107), // Amber
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFFFC107),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      title: const Text(
                        "Contact Us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),

                    // Divider
                    // ignore: deprecated_member_use
                    Divider(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.2),
                      height: 1,
                      indent: 70,
                      endIndent: 16,
                    ),

                    // 2. Send Feedback
                    ListTile(
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("Feedback Page")))));
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      leading: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF), // Purple
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF6C63FF),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.mail,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      title: const Text(
                        "Send Feedback",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 10.0),
                child: Text(
                  "Accounts",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C2039),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // 1. Rate App
                    // ignore: deprecated_member_use
                   

                    ListTile(
                      onTap: () async {
                        await DatabaseMethods().signOutUser();

                        if (!context.mounted) return;

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                          (route) => false,
                        );
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      leading: Icon(
                      Icons.logout,
                      color: Colors.redAccent,
                      size: 22.0,
                    ), 
                      title: const Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                     Divider(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.2),
                      height: 1,
                      indent: 70,
                      endIndent: 16,
                    ),
                     ListTile(
                      onTap: () async {
                        await DatabaseMethods().deleteUserAccount();

                        if (!context.mounted) return;

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                          (route) => false,
                        );
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      leading: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size:22.0,
                    ), 
                      title: const Text(
                        "Delete Account",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 16,
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
