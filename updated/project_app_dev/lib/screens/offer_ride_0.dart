import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app_dev/bloc/listing/listing_bloc.dart';
// import 'package:project_app_dev/auth/firebase_functions.dart';
// import 'package:project_app_dev/bloc/listing/listing_repo.dart';
import 'package:project_app_dev/bloc/user/auth_bloc.dart';
import 'package:project_app_dev/screens/offer_ride.dart';
import 'package:project_app_dev/screens/splash_1.dart';

class OfferedList extends StatefulWidget {
  const OfferedList({super.key});

  @override
  State<OfferedList> createState() => _OfferedListState();
}

class _OfferedListState extends State<OfferedList> {
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
              'Let\'s ride together',
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
          body: Column(children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Here are all the lisitings',
                    style: TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42), fontSize: 15),
                  ),
                  TextSpan(
                      text: '    Create a new offer --->',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 118, 151, 42),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OfferRide(),
                              ),
                            )),
                ],
              ),
            ),
            StreamBuilder(
                stream: db.collection('ridelisting').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("error");
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            final list = [
                              [
                                'Mobile No. ',
                                snapshot.data!.docs[i]['mobile'].toString()
                              ],
                              [
                                'Car Number:',
                                snapshot.data!.docs[i]['car'].toString()
                              ],
                              [
                                'Src: ',
                                snapshot.data!.docs[i]['source'].toString()
                              ],
                              [
                                'Dest: ',
                                snapshot.data!.docs[i]['destination'].toString()
                              ],
                              [
                                'Start Day: ',
                                snapshot.data!.docs[i]['strtday'].toString()
                              ],
                              [
                                'End Day: ',
                                snapshot.data!.docs[i]['endday'].toString()
                              ],
                              [
                                'Price per seat: ',
                                snapshot.data!.docs[i]['price'].toString()
                              ],
                              [
                                'No. of seats: ',
                                snapshot.data!.docs[i]['seats'].toString()
                              ],
                              [
                                'Leaving time: ',
                                snapshot.data!.docs[i]['time'].toString()
                              ],
                            ];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(255, 118, 151, 42),
                                    ),
                                    height: 200,
                                    child: GridView.builder(
                                      padding: const EdgeInsets.all(16.0),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        // crossAxisSpacing: 2,
                                        // mainAxisSpacing: 2,
                                        childAspectRatio: 3.0,
                                      ),
                                      itemCount: list.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 200,
                                          child: ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(horizontal: 8.0),
                                            leading: Text(
                                              list[index][0], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                            ),
                                            trailing: Text(list[index][1], style: TextStyle(color: Colors.white),),
                                          ),
                                  
                                          
                                        );
                                      
                                      },
                                      
                                    ),
                                    
                                    
                                  ),
                                  Row(
                                    children: [
                                      // EDIT
                                                
                                                SizedBox.fromSize(
                                                    size: Size(45, 40),
                                                            child: ClipOval(
                                                              child: Material(
                                                                color: Colors.transparent,
                                                                child: InkWell(
                                                                  splashColor: Colors.blue, 
                                                                 onTap: () {
                                                                                        final user_id = context.read<AuthBloc>().state.user!.uid;
                                                                                     
                                                                                          if (user_id != null) {
                                                                                            
                                                                                                    context.read()<ListingBloc>().add(UpdateListingEvent(docId: i.toString(), uid:user_id,carumber: snapshot.data!.docs[i]['car'].toString(), mobileNumber: snapshot.data!.docs[i]['mobile'].toString(), price:  snapshot.data!.docs[i]['price'].toString(),seats: snapshot.data!.docs[i]['seats'].toString(),source:  snapshot.data!.docs[i]['source'].toString(), destination: snapshot.data!.docs[i]['destination'].toString(),time: snapshot.data!.docs[i]['time'].toString(), startDate: snapshot.data!.docs[i]['strtday'].toString(), endDate:  snapshot.data!.docs[i]['endday'].toString()));
                                                                                          } else {
                                                                                            print("----------------------USER ID NULL HAI-----------------");
                                                                                          }

                                                                          

                                                                 }, 
                                                                  child: const Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: <Widget>[
                                                                      Icon(Icons.edit, size: 15, color: Color.fromARGB(255, 3, 0, 163),), //
                                                                          Text("Edit", style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 3, 0, 163), fontWeight: FontWeight.bold),), 
                                                                    ],
                                                                 ),
                                                                ),
                                                             ),
                                                            ),
                                                          ),

                                                                    const SizedBox(width: 10,),
                                                // DELETE

                                                SizedBox.fromSize(
                                                    size: Size(45, 40),
                                                            child: ClipOval(
                                                              child: Material(
                                                                color: Colors.transparent,
                                                                child: InkWell(
                                                                  splashColor: Colors.blue, 
                                                                 onTap: () {
                                                                  
                                                                 context.read()<ListingBloc>().add(DeleteListingEvent(docId: i.toString()));
                                                                 }, 
                                                                  child: const Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: <Widget>[
                                                                      Icon(Icons.delete, size: 15, color: Color.fromARGB(255, 163, 11, 0),), 
                                                                          Text(" Delete ", style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 163, 11, 0), fontWeight: FontWeight.bold),), 
                                                                    ],
                                                                 ),
                                                                ),
                                                             ),
                                                            ),
                                                          ),
                                    ],
                                  )
                                    
                                ],
                              ),
                            );
                          }),
                    );
                  }
                }),
          ])),
    );
  }
}
