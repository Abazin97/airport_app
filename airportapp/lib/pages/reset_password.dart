import 'package:airportapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  final formKeyEmail = GlobalKey<FormState>();
  final formKeyPhone = GlobalKey<FormState>();
  final formKeyVerify = GlobalKey<FormState>();
  String? signInMethod = "email";
  String errorMsg = '';
  bool isEmail = true;
  bool isPhone = false;
  bool isLoading = false;
  

  @override
  void dispose(){
    controllerEmail.dispose();
    super.dispose();
  }

  void resetPassword()async{
    try {
      await authService.value.resetPassword(email: controllerEmail.text);
      showSnackBar();
      setState(() {
        errorMsg = '';
        isLoading = false;
      });
    }on FirebaseAuthException catch (e) {
      setState(() {
        errorMsg = e.message ?? 'This is not working';
      });
    }
  }

  void showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Check your email'), 
        showCloseIcon: true,
        duration: const Duration(seconds: 10),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      )
    );
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
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('HKairportRewards', style: TextStyle(color: const Color.fromARGB(255, 126, 183, 129), fontSize: 24, fontFamily: 'Quicksand')),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text('Login', style: TextStyle(color: Colors.teal)),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
                        child: Column(
                          children: [
                            Text('Forgot Password', style: TextStyle(color: Colors.teal, fontSize: 26, fontWeight: FontWeight.w200),),
                            SizedBox(height: 40),
                            Text('Please select your account sign in method:', style: TextStyle(color: Colors.teal[600]),),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: "email",
                                      groupValue: signInMethod,
                                      onChanged: (value) {
                                        setState(() => signInMethod = value!);
                                      },
                                      activeColor: Colors.teal,
                                    ),
                                    Text("Email Address", style: TextStyle(color: Colors.teal[600])),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: "phone",
                                      groupValue: signInMethod,
                                      onChanged: (value) {
                                        setState(() => signInMethod = value!);
                                      },
                                      activeColor: Colors.teal,
                                    ),
                                    Text("Mobile Number", style: TextStyle(color: Colors.teal[600])),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            if (signInMethod == "email")
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email Address', style: TextStyle(color: Colors.teal[600])),
                                  Form(
                                    key: formKeyEmail,
                                    child: TextFormField(
                                      controller: controllerEmail,
                                      decoration: InputDecoration(border: OutlineInputBorder()),
                                      validator: (String? value){
                                        if (value == null || value.trim().isEmpty){
                                          return 'The email address is either invalid or does not exist.\nPlease try again.';
                                        }
                                        return null;
                                      },
                                    )
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () { 
                                      if (formKeyEmail.currentState!.validate()){
                                        resetPassword();
                                      }
                                    }, 
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: Size(double.infinity, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                    child: Text('Next', style: TextStyle(color: Colors.white),)
                                  )
                                ],
                              ),
                            if (signInMethod == "phone")
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mobile Number', style: TextStyle(color: Colors.teal[600])),
                                  Form(
                                    key: formKeyPhone,
                                    child: TextFormField(
                                      controller: controllerPhone,
                                      decoration: InputDecoration(border: OutlineInputBorder(), prefixText: "+1")
                                    )
                                  )
                                ],
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[700],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('HKairportRewards', style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Quicksand')),
                          SizedBox(height: 10),
                          Text('Contact Us', style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                          SizedBox(height: 10),
                          Text('FAQ', style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                          SizedBox(height: 10),
                          Text('Terms and Conditions', style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                          SizedBox(height: 10),
                          Text('Privacy Policy', style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                          SizedBox(height: 20),
                          Divider(),
                          Text('Copyright © Airport Authority Hong Kong', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                        ],
                      ),
                    ),
                  )
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}