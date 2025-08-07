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
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final formKeyEmail = GlobalKey<FormState>();
  final formKeyPhone = GlobalKey<FormState>();
  String verificationId = "";
  String errorMsg = '';
  String fieldError = '';
  bool showOtpField = false;
  bool isTouched = false;

  @override
  void dispose(){
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }


  void signIn()async{
    await authService.value.signIn(
      login: "+1${phoneController.text}",
      verificationId: verificationId,
      smsCode: otpController.text
    );
  }

  void linkEmailPass()async{
    try {
      final user = authService.value.firebaseAuth.currentUser;
      if(user != null){
        final emailCred = EmailAuthProvider.credential(
          email: controllerEmail.text, 
          password: controllerPassword.text
        );
        await user.linkWithCredential(emailCred);
        if (!mounted) return;
        popPage();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void sendCode()async{
    await authService.value.sendOtp(
      phoneNumber: "+1${phoneController.text}", 
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
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
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
                  key: formKeyPhone,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mobile Number (For account login)', style: TextStyle(color: Colors.teal)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        decoration: InputDecoration(border: OutlineInputBorder(), prefixText: "+1"),
                        onChanged: (value) {
                          setState(() {
                            isTouched = true;
                            if (value.trim().isEmpty){
                              showOtpField = false;
                              fieldError = isTouched ? 'This is a required field.' : '';
                            }else{
                              fieldError = '';
                              showOtpField = true;
                            }
                          });
                        },
                        validator: (String? value){
                          if (value == null || value.trim().isEmpty){
                            return 'This is a required field.';
                          }
                          return null;
                        },
                      ),
                      if (fieldError.isNotEmpty)
                        Text(
                          fieldError,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      SizedBox(height: 5),
                      if (showOtpField)
                        ElevatedButton(
                          onPressed: (){
                            if (formKeyPhone.currentState!.validate()){
                              sendCode();
                            }
                          }, 
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: Size(double.infinity, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                          child: Text('Get Verification Code', style: TextStyle(color: Colors.white),)
                        ),
                    ]
                  ),
                ),

                const SizedBox(height: 20),
                
                Form(
                  key: formKeyEmail,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showOtpField)
                          TextFormField(
                            controller: otpController,
                            decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Verification Code', hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500])),
                            validator: (String? value) {
                            if (value == null || value.trim().isEmpty){
                              return 'This is a required field.';
                            }
                            return null;
                            },
                          ),
                          SizedBox(height: 5),
                        if (showOtpField)
                          ElevatedButton(
                            onPressed: (){
                              signIn();
                            }, 
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: Size(double.infinity, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                            child: Text('Verify', style: TextStyle(color: Colors.white),)
                          ),
                        SizedBox(height: 20),
                        Text('Email Address', style: TextStyle(color: Colors.teal)),
                        TextFormField(
                          controller: controllerEmail,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty){
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
                  )
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKeyEmail.currentState!.validate()){
                      linkEmailPass();
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