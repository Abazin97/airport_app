import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarCell extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final DateTime date;

  const CalendarCell({super.key, required this.index, required this.isSelected, required this.onTap, required this.date});

  @override
  Widget build(BuildContext context) {

  final String day = DateFormat('dd').format(date);
  final String weekday = DateFormat('EEE').format(date);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 60,
        width: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.blue[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if(isSelected && index == 1)
              Text('(Today)', style: TextStyle(color: Colors.blue[900], fontSize: 13)),
            Text(
              day,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue[900] : Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              weekday,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue[900] : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
