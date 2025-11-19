import 'package:airportapp/providers/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavWid extends StatelessWidget {
  const BottomNavWid({super.key, required this.icon, required this.text, this.index = 0, this.active = false});
  
  final IconData icon;
  final String text;
  final int index;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final Color currentColor = active ? Colors.blue[800]! : Colors.grey;
    return GestureDetector(
      onTap: () {
        context.read<NavProvider>().pageIndex = index;
      },
      child: SizedBox(
        height: 90,
        width: 90,
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Icon(icon, color: currentColor),
              SizedBox(height: 4,
              ),
              Text(
                text, 
                style: TextStyle(color: currentColor, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Cal Sans')
              )
            ],
          ),
        )
          
      ),
    );
  }
}