import 'package:airportapp/data/database.dart';
import 'package:airportapp/pages/art_culture.dart';
import 'package:flutter/material.dart';


class AllEvents extends StatelessWidget {
  const AllEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'All Events',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
          )
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Database.allEventsName.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ArtCulture.tile(context,index),
          );
        }
      ),
    );
  }
}