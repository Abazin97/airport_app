import 'package:airportapp/pages/change_pass.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  //User? user = authService.value.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: Colors.white)),
        title: Text('My Profile', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Divider(),
                  Text('Email Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  //Text(user?.email ?? ''),
                  Divider(),
                  Text('Mobile Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  //Text(user?.phoneNumber ?? ''),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          Text('******'),
                        ]
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePass())),
                        child: Text('Edit', style: TextStyle(color: Colors.blue[900]),),
                      )
                    ]
                  ),
                  Divider(),
                  Text('Account Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  Text('Airport Visitor'),
                  Divider(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}