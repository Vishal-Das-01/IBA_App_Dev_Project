import 'package:flutter/material.dart';
import 'package:project_app_dev/auth/register.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Let\'s ride together', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 118, 151, 42)),)),

      ),

    body: Center(
      child: Column(
        children: [
         Image.asset('assets/images/logo2.png', width: 500,),
         const SizedBox(height: 20,),
         Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity, 
          height: 60,

          child: ElevatedButton(
            onPressed: () {
                Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  const RegisterScreen(),
        ),
      );
            }, 
               style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 219, 255, 134),
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.sizeOf(context).width * 0.3,
                        20,
                        MediaQuery.sizeOf(context).width * 0.3,
                        20),
                    shape: const StadiumBorder(),
                  ),
            child: const Text(
                'Lets get started',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),),
         )
        ],
      ),
    ),


    );
  }
}