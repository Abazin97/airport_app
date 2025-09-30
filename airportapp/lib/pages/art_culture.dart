import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/data/database.dart';
import 'package:airportapp/pages/all_events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtCulture extends StatelessWidget {
  const ArtCulture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Art & Culture',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Provider.of<NavProvider>(context, listen: false).pageIndex = 7;
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )
        )
      ),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (context) => AllEvents()));
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('All Events', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)
            ],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Database.allEventsName.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: tile(index),
                );
              }
            ),
          ),
        )
      ],),
    );
  }
  static Widget tile(index){
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 270,
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  Database.allEventsImage[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              Database.allEventsName[index],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              Database.allEventsDescription[index],
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );

  }
}