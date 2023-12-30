import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_app_dev/auth/firebase_functions.dart';
import 'package:project_app_dev/auth/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Login - Let\'s ride together',
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
              const SizedBox(
                height: 10,
              ),
              // const Text(
              //   "Login yourself",
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 129, 103, 212),
                 
              //   ),
              // ),
              Image.asset(
                'assets/images/logo2.png',
                width: 400,
              ),
              const SizedBox(
                height: 10,
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
                    signInWithEmailAndPassword(
                        emailController.text, passwordController.text, context);
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
                    'Login !',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: Color.fromARGB(255, 118, 151, 42)),
                    ),
                    TextSpan(
                        text: ' Register your self',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 118, 151, 42),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              )),
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
