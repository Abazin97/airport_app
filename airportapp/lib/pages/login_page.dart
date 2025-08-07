import 'package:airportapp/pages/reset_password.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerPassCode = TextEditingController();
  final formKeyPhone = GlobalKey<FormState>();
  final formKeyLogin = GlobalKey<FormState>();
  String verificationId = "";
  String errorMsg = '';
  bool showOtpField = false;
  bool isTouched = false;
  bool isChecked = true;

  @override
  void dispose(){
    controllerLogin.dispose();
    controllerPassCode.dispose();
    super.dispose();
  }

  void signIn()async{
    try {
      await authService.value.signIn(
        login: controllerLogin.text, 
        password: controllerPassCode.text,
        verificationId: verificationId,
        smsCode: controllerPassCode.text,  
      );
      popPage();
    }on FirebaseAuthException catch (e) {
      setState(() {
        errorMsg = e.message ?? 'This is not working';
      });
    }
  }

  void sendCode()async{
    await authService.value.sendOtp(
      phoneNumber: controllerLogin.text, 
      onCodeSent: (verId){
        setState(() {
          verificationId = verId;
          showOtpField = true;
        });
      }, 
      onError: (e) => debugPrint(e.toString()),
      onTimeout: (verId) {
        verificationId = verId;
      },
    );
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
            height: MediaQuery.of(context).size.height + 200,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
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
                            padding: const EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 10),
                            child: Text('Welcome to HKairport\nRewards', style: TextStyle(fontSize: 26, color: const Color.fromARGB(255, 126, 183, 129)), textAlign: TextAlign.center),
                          ),
                          SizedBox(height: 10),
                          Text(errorMsg, style: TextStyle(color: Colors.redAccent)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                Form(
                                  key: formKeyPhone,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: controllerLogin,
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
                                        onChanged: (value) {
                                          setState(() {
                                            if (value.trim().isEmpty){
                                              showOtpField = false;
                                            }else{
                                              showOtpField = true;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(height: 5),
                                      if (showOtpField)
                                        ElevatedButton(
                                          onPressed: (){
                                            if (formKeyPhone.currentState!.validate()){
                                              sendCode();
                                            }
                                          }, 
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: Size(double.infinity, 40), shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                                          child: Text('Get Verification Code', style: TextStyle(color: Colors.white),)
                                        ),
                                    ]
                                  )
                                ),
                                SizedBox(height: 5),
                                Form(
                                  key: formKeyLogin,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      TextFormField(
                                        controller: controllerPassCode,
                                        keyboardType: TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                          hintText: 'Password / SMS Code',
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
                                    ],
                                  ),
                                )
                              ],
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
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword())),
                            child: Text('Forgot your password?', style: TextStyle(color: Colors.teal))),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (formKeyLogin.currentState!.validate()){
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
                    ]
                  )
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
            )
          )
        ],
      ),
    ); 
  }
}