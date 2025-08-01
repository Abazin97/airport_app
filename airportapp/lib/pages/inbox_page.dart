import 'package:airportapp/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';


class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white, 
          )
        ),
        title: Text(
          'Inbox',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        ),
        actions: [
          IconButton(
            onPressed: (){

            }, 
            icon: Icon(Icons.more_horiz, 
            color: Colors.white,))
        ],
        centerTitle: true,
      ),
    );
  }
}