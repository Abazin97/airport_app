import 'package:airportapp/components/home_screen/static_tile_item.dart';
import 'package:flutter/material.dart';

class StaticTile extends StatelessWidget{
  final StaticTileItem item;
  const StaticTile({super.key, required this.item});


  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.push((context), MaterialPageRoute(builder: (_) => item.screen));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        height: 300,
        width: 270,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 130,
                child: Image.asset(                      
                  item.image,
                  fit: BoxFit.fill,
                ),
              ),  
              Container(
                height: 5,
                width: double.infinity,
                color: Colors.yellow,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 7),
                    Text(item.description, style: TextStyle(fontSize: 15))
                  ]
                )
              ),
            ]
          ),
        ),
      ),
    );
  }
}