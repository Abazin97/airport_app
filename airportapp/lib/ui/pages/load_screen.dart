import 'package:airportapp/ui/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 150),
                  Image.asset('lib/assets/airport_logo.png'),
                  Text(
                    'Experience your way',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                  SizedBox(height: 150),
                  Text(
                    'The initial loading may take some time. Thank you for your patience.'
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                  children: [
                    Image.asset(
                      'lib/assets/idc.png',
                      fit: BoxFit.cover,
                      width: 190,
                      height: 75,
                    ),
                    SizedBox(width: 50),
                    Image.asset(
                      'lib/assets/award.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}