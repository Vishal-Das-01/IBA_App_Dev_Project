import 'package:flutter/material.dart';
import 'package:project_app_dev/screens/offer_ride.dart';

class SplashNext extends StatelessWidget {
  const SplashNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color.fromARGB(255, 233, 255, 182),Color.fromARGB(255, 215, 253, 125)])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(child: Text('Let\s ride together', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),)),
          backgroundColor: Color.fromARGB(255, 118, 151, 42),
        ),
      
      body: Center(
        child: Column(
          children: [
           Image.asset('assets/images/logo2.png', width: 400,),
      
           const SizedBox(height: 30,),
      
           Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 60,
      
            child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 201, 250, 87),
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.sizeOf(context).width * 0.3,
                          20,
                          MediaQuery.sizeOf(context).width * 0.3,
                          20),
                      shape: const StadiumBorder(),
                    ),
              onPressed: () {
                    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OfferRide(),
          ));
              }, 
              child: const Text(
                  'Offer a ride',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
           ),
           const SizedBox(height: 50,),
      
           Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 60,
      
            child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 201, 250, 87),
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.sizeOf(context).width * 0.3,
                          20,
                          MediaQuery.sizeOf(context).width * 0.3,
                          20),
                      shape: const StadiumBorder(),
                    ),
              onPressed: () {
                
              }, 
              child: const Text(
                  'Want a ride',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
           ),
      
                    const SizedBox(
                      height: 30,
                    ),
                      
      
      
          ],
        ),
      ),
      
      
      ),
    );
  }
}