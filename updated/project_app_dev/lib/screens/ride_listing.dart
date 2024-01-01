// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project_app_dev/auth/firebase_functions.dart';
import 'package:project_app_dev/bloc/user/auth_bloc.dart';
import 'package:project_app_dev/screens/splash_1.dart';

class RideList extends StatefulWidget {
  const RideList({super.key});

  @override
  State<RideList> createState() => _RideListState();
}

class _RideListState extends State<RideList> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromARGB(255, 233, 255, 182),
            Color.fromARGB(255, 203, 250, 95)
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
                color: const Color.fromARGB(255, 203, 250, 95),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SplashNext(),
                      ));
                },
                icon: const Icon(Icons.home)),
            title: const Center(
                child: Text(
              'Let\s ride together',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
            backgroundColor: const Color.fromARGB(255, 118, 151, 42),
            actions: [
              IconButton(
                  color: const Color.fromARGB(255, 203, 250, 95),
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOutRequestedEvent());
                  },
                  icon: const Icon(Icons.logout)),
            ],
          ),
          body: Column(
            children: [
              const Center(
                  child: Text(
                "Here are all the offers....",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 118, 151, 42)),
              )),
              StreamBuilder(
                stream: db.collection('ridelisting').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text("error");
                  }

                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, int index) {
                          // DocumentSnapshot documentSnapshot =
                          //       snapshot.data!.docs[index];
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 10, 10, 10),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        225, 221, 255, 189),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Mobile number

                                      Text.rich(TextSpan(
                                          text: "Mobile Number: - ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: snapshot
                                                  .data!.docs[index]['mobile']
                                                  .toString(),
                                              // style: TextStyle(fontSize: 20),
                                            )
                                          ])),

                                      // Car number

                                      Text.rich(TextSpan(
                                          text: "Car Number: - ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: snapshot
                                                  .data!.docs[index]['car']
                                                  .toString(),
                                              // style: TextStyle(fontSize: 20),
                                            )
                                          ])),

                                      // Source

                                      Text.rich(TextSpan(
                                          text: "Source: - ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: snapshot
                                                  .data!.docs[index]['source']
                                                  .toString(),
                                              // style: TextStyle(fontSize: 20),
                                            )
                                          ])),

                                      // Destination

                                      Text.rich(TextSpan(
                                          text: "Destination: - ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: snapshot.data!
                                                  .docs[index]['destination']
                                                  .toString(),
                                              // style: TextStyle(fontSize: 20),
                                            )
                                          ])),

                                      // Start day

                                      Text.rich(TextSpan(
                                          text: "Start day: - ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: snapshot
                                                  .data!.docs[index]['strtday']
                                                  .toString(),
                                              // style: TextStyle(fontSize: 20),
                                            )
                                          ])),

                                      // Start day

                                      Text.rich(TextSpan(
                                          text: "End day: - ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: snapshot
                                                  .data!.docs[index]['endday']
                                                  .toString(),
                                              // style: TextStyle(fontSize: 20),
                                            )
                                          ])),

                                      // date

                                      Text.rich(TextSpan(
                                          text: "Time: - ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: snapshot
                                                  .data!.docs[index]['time']
                                                  .toString(),
                                              // style: TextStyle(fontSize: 20),
                                            )
                                          ])),

                                      // price

                                      Text.rich(TextSpan(
                                          text: "Price per seat: - ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: snapshot
                                                  .data!.docs[index]['price']
                                                  .toString(),
                                              // style: TextStyle(fontSize: 20),
                                            )
                                          ])),

                                      // No. of seats: -

                                      Text.rich(TextSpan(
                                          text: "No. of seats: -  ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: snapshot
                                                  .data!.docs[index]['seats']
                                                  .toString(),
                                              // style: TextStyle(fontSize: 20),
                                            )
                                          ])),

                                      // const Text( "Mobile Number: - ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      // Text(snapshot.data!.docs[index]['mobile'].toString()),
                                      //  RichText(

                                      //   text: TextSpan(
                                      //     style: DefaultTextStyle.of(context).style,
                                      //     children: [
                                      //       const TextSpan(text: "Mobile Number: - ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      //       TextSpan(text: (snapshot.data!.docs[index]['mobile'].toString()),),

                                      //       const TextSpan(text: "Car number: -  ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      //       TextSpan(text: (snapshot.data!.docs[index]['car'].toString()),),
                                      //       const TextSpan(text: "Date: -  ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      //       TextSpan(text: (snapshot.data!.docs[index]['date'].toString()),),
                                      //       const TextSpan(text: "Price per seat: -  PKR", style: TextStyle(fontWeight: FontWeight.bold)),
                                      //       TextSpan(text: (snapshot.data!.docs[index]['price'].toString()),),
                                      //       const TextSpan(text: "No. of seats: -  ", style: TextStyle(fontWeight: FontWeight.bold)),
                                      //       TextSpan(text: (snapshot.data!.docs[index]['seats'].toString()),),
                                      //     ]
                                      //   )
                                      //  ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                          // Text(documentSnapshot['car'].toString()),
                          // Text(documentSnapshot['seats'].toString()),
                          // Text(documentSnapshot['price'].toString()),
                          // Text(documentSnapshot['date'].toString()),
                        }),
                  );
                },
              ),
            ],
          )),
    );
  }
}
