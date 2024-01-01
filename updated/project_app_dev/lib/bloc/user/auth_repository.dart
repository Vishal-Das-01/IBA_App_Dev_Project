import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app_dev/auth/login.dart';
import 'package:project_app_dev/screens/splash_1.dart';



class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final fb_auth.FirebaseAuth firebaseAuth;

  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Stream<fb_auth.User?> get user => firebaseAuth.userChanges();

createUserWithEmailAndPassword(
    String emailAddress, String password, BuildContext context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashNext(),
        ),
      );

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text("Successfully registered")),
          backgroundColor: Colors.green,
        ),
      );
    } else {}
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text("The password provided is too weak.")),
          backgroundColor: Colors.red,
        ),
      );
      // print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text("The account already exists for that email.")),
          backgroundColor: Colors.red,
        ),
      );
      // print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

signInWithEmailAndPassword(
    String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    User? user = credential.user;
    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashNext(),
          ));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text("Login Successfully")),
          backgroundColor: Colors.green,
        ),
      );
    } else {}
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text("No user found for that email.")),
          backgroundColor: Colors.red,
        ),
      );
      // print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text("Wrong password provided for that user.")),
          backgroundColor: Colors.red,
        ),
      );
      // print('Wrong password provided for that user.');
    }
  }
}
// Logout

signOut(BuildContext context) async{
  await FirebaseAuth.instance.signOut();

     // ignore: use_build_context_synchronously
     Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
}

}
