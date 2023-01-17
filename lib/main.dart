import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const LoginApp(),
  );
}

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.blue,
          title: const Text(
            "Login Info",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Stepper(
              currentStep: currentStep,
              onStepTapped: (val) {
                setState(() {
                  currentStep = val;
                });
              },
              onStepContinue: () {
                setState(() {
                  if (currentStep < 2) currentStep++;
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currentStep > 0) currentStep--;
                });
              },
              steps: [
                Step(
                  isActive: currentStep >= 0,
                  title: const Text("Sing up"),
                  content: Column(
                    children: [
                      TextField(
                        cursorColor:Colors.blue,
                        decoration: decoration(
                            Icons.person_outline, "Full Name"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        cursorColor:Colors.blue,
                        decoration: decoration(
                            Icons.email_outlined, "Email Address"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        cursorColor:Colors.blue,
                        decoration: decoration(Icons.lock_outline, "Password"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        cursorColor:Colors.blue,
                        decoration:
                        decoration(Icons.lock_outline, "Conform Password"),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Step(
                  isActive: currentStep >= 1,
                  title: const Text("Login"),
                  content: Column(
                    children: [
                      TextField(
                        cursorColor:Colors.blue,
                        decoration: decoration(
                            Icons.person_outline, "User Name"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        cursorColor:Colors.blue,
                        decoration: decoration(Icons.lock_outline, "Password"),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Step(
                  isActive: currentStep >= 2,
                  title: const Text("Home"),
                  content: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  decoration(icon, String hint) {
    return InputDecoration(
        icon: Icon(icon,color: Colors.blue,),
        iconColor: Colors.blue,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black),
        ),
        filled: true,
        fillColor: Colors.white
    );
  }
}