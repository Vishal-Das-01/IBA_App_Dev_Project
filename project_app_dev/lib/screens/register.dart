import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(child: Text('Lets ride together', style: TextStyle(fontSize: 20),)),

      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1, right: 40),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', width: 500,),
           const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: 30,),
        
              Center(
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 64, 20, 209),
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.sizeOf(context).width * 0.3,
                              20,
                              MediaQuery.sizeOf(context).width * 0.3,
                              20),
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Register !',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                        
            ],
          ),
        ),
      ),

    );
  }
}