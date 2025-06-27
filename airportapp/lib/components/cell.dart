import 'package:airportapp/components/cell_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Cell extends StatelessWidget {

  final CellItem item;
  const Cell({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        if(item.link != null){
          final _url = Uri.parse(item.link!);
          await launchUrl(_url, mode: LaunchMode.inAppWebView);
        }else if(item.screen != null){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => item.screen!,
            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.indigo[700],
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Image.asset(item.image),
            ),
          ),
          const SizedBox(height: 15),
          Text(item.name, 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}



