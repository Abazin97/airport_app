import 'package:airportapp/components/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:airportapp/pages/load_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() async{
  //debugPaintSizeEnabled = true;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NavProvider(),
      ),
      
    ],
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: LoadScreen(),
    );
  }
}
