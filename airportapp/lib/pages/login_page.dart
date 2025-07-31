import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/me_page.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = true;
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

  void signIn()async{
    try {
      await authService.value.signIn(email: controllerEmail.text.toString(), password: controllerPassword.text.toString());
      popPage();
    }on FirebaseAuthException catch (e) {
      setState(() {
        errorMsg = e.message ?? 'This is not working';
      });
    }
  }

  void popPage(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: Colors.white))
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 240,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('HKairportRewards', style: TextStyle(color: const Color.fromARGB(255, 126, 183, 129), fontSize: 24, fontFamily: 'Quicksand')),
                      IconButton(onPressed: () {}, icon: Icon(Icons.language, size: 35))
                    ],
                  ),
                ),
                Image.asset('lib/images/login_asset.png')
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 20),
                child: Text('Welcome to HKairport\nRewards', style: TextStyle(fontSize: 26, color: const Color.fromARGB(255, 126, 183, 129)), textAlign: TextAlign.center),
              ),
              SizedBox(height: 10),
              Text(errorMsg, style: TextStyle(color: Colors.redAccent)),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email / Mobile Number(With Country/Area Code, e.g.)', 
                          hintStyle: TextStyle(fontSize: 11),
                          prefixIcon: Icon(Icons.person_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: controllerPassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 11),
                          prefixIcon: Icon(Icons.key),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked, 
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = newBool!;
                      });
                    }),
                  Text('Stay logged in')
                ],
              ),
              Text('Forgot your password?', style: TextStyle(color: Colors.teal)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()){
                          signIn();
                        }
                      }, 
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: Size(double.infinity, 40), shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)), child: Text('Log In', style: TextStyle(color: Colors.white))),
                    Row(children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                          endIndent: 40, 
                        ),
                      ),
                      Text('Or log in with'),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 40,
                        ),
                      ),
                    ]),
                    
                  ],
                ),
              )
            ]
          )
        ],
      ),
    );
    
  }
}