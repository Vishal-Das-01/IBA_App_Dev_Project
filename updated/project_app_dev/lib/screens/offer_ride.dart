import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app_dev/bloc/listing/listing_bloc.dart';
import 'package:project_app_dev/bloc/listing/listing_repo.dart';
// import 'package:project_app_dev/auth/firebase_functions.dart';
import 'package:project_app_dev/bloc/user/auth_bloc.dart';
import 'package:project_app_dev/screens/ride_listing.dart';
import 'package:project_app_dev/screens/splash_1.dart';

class OfferRide extends StatefulWidget {
  const OfferRide({super.key});

  @override
  State<OfferRide> createState() => _OfferRideState();
}

class _OfferRideState extends State<OfferRide> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController carController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController seatController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController startdayController = TextEditingController();
  TextEditingController enddayController = TextEditingController();

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
            Color.fromARGB(255, 215, 253, 125)
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
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
          backgroundColor: const Color.fromARGB(255, 118, 151, 42),
          actions: [
            IconButton(
                color: const Color.fromARGB(255, 203, 250, 95),
                onPressed: () {
                  context.read()<AuthBloc>().add(SignOutRequestedEvent());
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1, right: 40),
            child: Column(
              children: [
                const Text(
                  "Create offer below",
                  style: TextStyle(fontSize: 15),
                ),
                Image.asset(
                  'assets/images/logo2.png',
                  width: 300,
                ),

                const SizedBox(
                  height: 10,
                ),

                // Mobile number

                TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    labelText: 'Mobile number',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Car number

                TextFormField(
                  controller: carController,
                  decoration: InputDecoration(
                    labelText: 'Car Number',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Source

                TextFormField(
                  controller: sourceController,
                  decoration: InputDecoration(
                    labelText: 'From where: - ',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Destination

                TextFormField(
                  controller: destinationController,
                  decoration: InputDecoration(
                    labelText: 'Destinaition: - ',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Start Day

                TextFormField(
                  controller: startdayController,
                  decoration: InputDecoration(
                    labelText: 'Start day: - ',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // End day

                TextFormField(
                  controller: enddayController,
                  decoration: InputDecoration(
                    labelText: 'End Day: - ',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: seatController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    labelText: 'No. Seats (only digits)',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    labelText: 'Price per seat (in PKR)',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
               
                TextFormField(
                  controller: timeController,
                  decoration: InputDecoration(
                    labelText: 'Time: - ',
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 118, 151, 42),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // const SizedBox(
                //   height: 10,
                // ),
                // TextFormField(
                //   controller: timeController,
                //   decoration: InputDecoration(
                //     labelText: 'Time',
                //     labelStyle: const TextStyle(
                //         color: Colors.black, fontWeight: FontWeight.bold),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(15),
                //       borderSide: const BorderSide(
                //         color: Colors.black,
                //       ),
                //     ),
                //   ),
                // ),

                const SizedBox(
                  height: 15,
                ),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // ListingRepostory listingRepostory = ListingRepostory();
                      // final userId = context.read<AuthBloc>().state.user!.uid;
                      // print(userId);
                      // await context.read()<ListingBloc>().add(AddListingEvent(
                      //     uid: userId,
                      //     carumber: carController.text,
                      //     mobileNumber: mobileController.text,
                      //     price: priceController.text,
                      //     seats: seatController.text,
                      //     source: sourceController.text,
                      //     destination: destinationController.text,
                      //     time: timeController.text,
                      //     startDate: startdayController.text,
                      //     endDate: enddayController.text));
                      //                              String mobile,
                      // String carNumber,
                      // String seat,
                      // String price,
                      // String time,
                      // String strtDay,
                      // String endDay,
                      // String source,
                      // String dest,
                      // BuildContext context,
                      // ignore: use_build_context_synchronously
                    //  listingRepostory.createOffer(
                    //       mobileController.text,
                    //       carController.text,
                    //       seatController.text,
                    //       priceController.text,
                    //       timeController.text,
                    //       startdayController.text,
                    //       enddayController.text,
                    //       sourceController.text,
                    //       destinationController.text,
                    //       context);

                    db.collection('ridelisting').add({
      'mobile': mobileController.text,
      'car': carController.text,
      'seats': seatController.text,
      'price': priceController.text,
      'time': timeController.text,
      'strtday': startdayController.text,
      'endday': enddayController.text,
      'source': sourceController.text,
      'destination': destinationController.text,
    });
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

                      // ignore: use_build_context_synchronously
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 201, 250, 87),
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.sizeOf(context).width * 0.3,
                          20,
                          MediaQuery.sizeOf(context).width * 0.3,
                          20),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'Offer Ride!!',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
