import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_app_dev/auth/login.dart';
import 'package:project_app_dev/firebase_options.dart';
import 'package:project_app_dev/screens/offer_ride.dart';
import 'package:project_app_dev/screens/ride_listing.dart';
import 'package:project_app_dev/screens/splash_1.dart';
// import 'package:project_app_dev/screens/offer_ride.dart';
// import 'package:project_app_dev/auth/register.dart';
// import 'package:project_app_dev/screens/offer_ride.dart';

// import 'package:project_app_dev/screens/ride_listing.dart';
// import 'package:project_app_dev/screens/splash.dart';
// import 'package:project_app_dev/screens/splash.dart';
// import 'package:project_app_dev/screens/splash_1.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
   
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RideList(),
    );
  }
}