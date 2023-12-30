import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app_dev/screens/ride_listing.dart';

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
  TextEditingController dateController = TextEditingController();

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
          title: const Center(
              child: Text(
            'Let\s ride together',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
          backgroundColor: Color.fromARGB(255, 118, 151, 42),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1, right: 40),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  height: 20,
                ),
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
                  decoration: InputDecoration(
                    labelText: 'Date',
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
                    onPressed: () async {
                      await db.collection('ridelist').add({
                        'mobile': mobileController.text,
                        'car': carController.text,
                        'seats': seatController.text,
                        'price': priceController.text,
                        'date': dateController.text,
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
