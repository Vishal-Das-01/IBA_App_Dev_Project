import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:project_app_dev/auth/login.dart';
// import 'package:project_app_dev/screens/splash_1.dart';



update(String docId){
  final washingtonRef = FirebaseFirestore.instance.collection("ridelisting").doc(docId);
washingtonRef.update({"capital": true}).then(
    (value) => print("DocumentSnapshot successfully updated!"),
    onError: (e) => print("Error updating document $e"));
}