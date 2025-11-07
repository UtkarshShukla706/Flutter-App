import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newpro1/firebase_options.dart';
import 'package:newpro1/pages/signin.dart';
// import 'package:newpro1/pages/chatpage.dart';
// import 'package:newpro1/pages/home.dart';
// import 'package:newpro1/pages/signin.dart';
// import 'package:newpro1/pages/signup.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // runApp(const MyApp());

  runApp(DevicePreview(
    
    builder: (context) => const MyApp(),
  ));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
       darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      // home: Home(),
       home: SignIn(),
    );
  }
}


