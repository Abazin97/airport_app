import 'package:airportapp/components/bottom_nav_bar.dart';
import 'package:airportapp/info%20pages/faq.dart';
import 'package:flutter/material.dart';

class TransportToFrom extends StatefulWidget {
  const TransportToFrom({super.key});

  @override
  State<TransportToFrom> createState() => _TransportToFromState();
}

class _TransportToFromState extends State<TransportToFrom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), 
        child: Stack(
          children: [
            Container(
              height: 80,
              color: Colors.blue[800],
              padding: const EdgeInsets.only(top: 30),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      )
                    ),
                  ),
                  Center(
                    child: Text(
                      'Transport to / from airport',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    )
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Faq()));
                      }, 
                      icon: Icon(
                        Icons.info_outline, 
                        color: Colors.white
                      )
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
