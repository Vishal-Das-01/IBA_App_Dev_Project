import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lets ride together', style: TextStyle(fontSize: 20),)),

      ),

    body: Center(
      child: Column(
        children: [
         Image.asset('assets/images/logo.png', width: 500,),
         const SizedBox(height: 20,),
         Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity, 
          height: 60,

          child: ElevatedButton(
            onPressed: () {
              
            }, 
            child: const Text(
                'Lets get started',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),),
         )
        ],
      ),
    ),


    );
  }
}