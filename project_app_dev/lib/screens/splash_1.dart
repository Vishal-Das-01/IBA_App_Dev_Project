import 'package:flutter/material.dart';

class SplashNext extends StatelessWidget {
  const SplashNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lets ride together', style: TextStyle(fontSize: 20),)),

      ),

    body: Center(
      child: Column(
        children: [
         Image.asset('assets/images/logo.png', width: 300,),

         const SizedBox(height: 70,),

         Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 60,

          child: ElevatedButton(
            onPressed: () {
              
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


    );
  }
}