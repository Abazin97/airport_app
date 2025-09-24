import 'package:airportapp/components/nav_provider.dart';
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
      )
    );
  }
}