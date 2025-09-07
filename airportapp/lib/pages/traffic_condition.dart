import 'package:flutter/material.dart';

class TrafficCondition extends StatelessWidget {
  const TrafficCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Traffic Condition',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close_outlined,
            color: Colors.white,
          )
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: Icon(
              Icons.share, 
              color: Colors.white
            )
          ),
        ],
      ),
    );
  }
}