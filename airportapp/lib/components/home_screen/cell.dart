import 'package:airportapp/components/home_screen/cell_item.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          if (item.index == 5){
            Provider.of<NavProvider>(context, listen: false).pageIndex = item.index!;
          }else{
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => item.screen!,
              ),
            );
          }
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
            clipBehavior: Clip.hardEdge,
            child: Center(
              child: Image.asset(
                item.image,
                fit: BoxFit.contain),
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