import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project_app_dev/auth/firebase_functions.dart';
import 'package:project_app_dev/auth/login.dart';
import 'package:project_app_dev/bloc/signUp/signUp_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {

   
  @override
  Widget build(BuildContext context) {

    void submit() async {
     await context.read<SignUpCubit>().signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          context : context,
        );
  }

    return  Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Register - Lets ride together',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 118, 151, 42)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1, right: 40),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo2.png',
                width: 500,
              ),
           
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 118, 151, 42), fontWeight: FontWeight.bold),
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
                controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 118, 151, 42), fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {

                      submit();
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 219, 255, 134),
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
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

               const SizedBox(height: 10),
                  RichText(
                   text: TextSpan(
                     children: <TextSpan>[
                       const TextSpan(
                         text: 'Already have an account? ',
                          style: TextStyle(color: Color.fromARGB(255, 118, 151, 42)),
                       ),
                       TextSpan(
                         text: ' Login',
                         style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 118, 151, 42),
                         ),
                         recognizer: TapGestureRecognizer()
                           ..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen(),),)

                           
                       ),
                     
                         
                       
                      
                     ],
                    ),
                  ),
           

            ],
          ),
        ),
      ),
    );
  }
}