import 'package:airportapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMsg = '';

  @override
  void dispose(){
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void register()async{
    try{
      await authService.value.createAccount(email: controllerEmail.text.toString(), password: controllerPassword.text.toString());
    popPage();
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMsg = e.message ?? 'There is an error';
      });
    }
  }

  void popPage(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              children: [
                Text('Registration', style: TextStyle(color: Colors.teal, fontSize: 24)),
                SizedBox(height: 40),
                Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Email Address', style: TextStyle(color: Colors.teal)),
                        TextFormField(
                          controller: controllerEmail,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                          validator: (String? value) {
                            if (value == null){
                              return 'This is a required field.';
                            }
                            if (value.trim().isEmpty){
                              return 'This is a required field.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text('Password', style: TextStyle(color: Colors.teal)),
                        TextFormField(
                          controller: controllerPassword,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                          validator: (String? value) {
                            if (value == null){
                              return 'This is a required field.';
                            }
                            if (value.trim().isEmpty){
                              return 'This is a required field.';
                            }
                            return null;
                          },
                        ),
                        Text(
                          errorMsg,
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  )),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()){
                      register();
                    }
                  }, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: Size(double.infinity, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)), child: Text('Sign Up', style: TextStyle(color: Colors.white))),
              ],
            ),
          )
        ],
        
      ),
    );
  }
}