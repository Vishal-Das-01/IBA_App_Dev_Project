import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OfferRide extends StatelessWidget {
  const OfferRide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(
            child: Text(
          'Lets ride together',
          style: TextStyle(fontSize: 20),
        ),
        ),
      ),

         body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1, right: 40),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', width: 300,),
           const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Car Number',
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
              const SizedBox(height: 10,),
              TextFormField(
                keyboardType: TextInputType.number,
                 inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly
                 ],
                decoration: InputDecoration(
                  labelText: 'No. Seats',
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
              const SizedBox(height: 10,),
              TextFormField(
                keyboardType: TextInputType.number,
                 inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly
                 ],
                decoration: InputDecoration(
                  labelText: 'Price in PKR',
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
              const SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date',
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
              const SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Time',
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
        
              const SizedBox(height: 15,),
        
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
                          'Offer Ride!!',
                          style: TextStyle(
                            fontSize: 15,
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
