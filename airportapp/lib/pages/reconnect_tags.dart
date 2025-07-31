import 'package:airportapp/components/form_field.dart';
import 'package:airportapp/info%20pages/personal_statement.dart';
import 'package:airportapp/info%20pages/terms_conditions1.dart';
import 'package:airportapp/info%20pages/terms_conditions2.dart';
import 'package:airportapp/utils/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class ReconnectTags extends StatefulWidget {
  const ReconnectTags({super.key});

  @override
  State<ReconnectTags> createState() => _ReconnectTagsState();
}

class _ReconnectTagsState extends State<ReconnectTags>{
  late TapGestureRecognizer _tapRecognizer;

  @override
  void initState(){
    super.initState();
    _tapRecognizer = TapGestureRecognizer()
    ..onTap = () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalStatement()));
    };
  }

  @override
  void dispose(){
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white, 
          )
        ),
        title: Text(
          'Reconnect Registered Tags',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('If you are Rewards member,\nplease go back and login via\nRewards member first.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: CustomField(
                    hintText: 'jonhwong@gmail.com', 
                    validator: (val){
                      if(!val!.isValidEmail){
                        return 'Please enter a valid Email Address';
                      }
                      return null;
                    }),
                ),
                SizedBox(height: 50),
                Text('Verify your email', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      width: 160,
                      child: CustomField(
                        hintText: 'Enter verification code', 
                        validator: (val){
                          if(!val!.isValidCode){
                            return 'Please enter a valid code';
                          }
                          return null;
                        }),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      }, 
                      style: ElevatedButton.styleFrom(minimumSize: Size(150, 40)),
                      child: Text('Get code')
                    )
                  ],
                ),
                SizedBox(height: 30),
                Text('Didn`t receive a code? Request again in 60 seconds. Please also check your junk mail box.', style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                SizedBox(height: 40),
                Text('Terms & Conditions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('By clicking "Confirm", i have read and agreed to the following Terms & Conditions:'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditions1()));
                  },
                  child: Text(
                    '-Use of MyTAG Series', 
                    style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline)
                  )
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditions2()));
                  },
                  child: Text(
                    '-Use of the Baggage Arrival Notice Service', 
                    style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline)
                  )
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(text: 'And i consent to provide the personal data as set out in\nthe',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: ' Personal Information Collection Statement.', style: TextStyle(color: Colors.blue[800], decoration: TextDecoration.underline),
                        recognizer: _tapRecognizer,
                      )
                    ]
                  ),
                )
                
              ]
            )
          )
        ],
      ),
    );
  }
}