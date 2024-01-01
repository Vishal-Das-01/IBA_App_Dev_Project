// fetch, update, delete, create

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_app_dev/screens/ride_listing.dart';

class ListingRepostory {
  final db = FirebaseFirestore.instance;

  createOffer(
      String mobile,
      String carNumber,
      String seat,
      String price,
      String time,
      String strtDay,
      String endDay,
      String source,
      String dest,
      BuildContext context) async {
    await db.collection('ridelisting').add({
      'mobile': mobile,
      'car': carNumber,
      'seats': seat,
      'price': price,
      'time': time,
      'strtday': strtDay,
      'endday': endDay,
      'source': source,
      'destination': dest,
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Offer added successfully!"),
      backgroundColor: Colors.green,
    ));
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RideList(),
        ));
  }

  updateOffer(
      String docId,
      String mobile,
      String carNumber,
      String seat,
      String price,
      String time,
      String strtDay,
      String endDay,
      String source,
      String dest,
      BuildContext context) async {
    await db.collection('ridelisting').doc(docId).update({
      'mobile': mobile,
      'car': carNumber,
      'seats': seat,
      'price': price,
      'time': time,
      'strtday': strtDay,
      'endday': endDay,
      'source': source,
      'destination': dest,
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Offer updated successfully!"),
      backgroundColor: Colors.green,
    ));
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RideList(),
        ));
  }

  deleteOffer(BuildContext context, String id) {
    db.collection('ridelisting').doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Center(child: Text("Deleted")),
      backgroundColor: Colors.red,
    ));
  }
}
