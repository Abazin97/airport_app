import 'package:airportapp/components/me_screen/cell_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Cell extends StatelessWidget {
  final CellItem item;
  const Cell({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {
        final url = Uri.parse(item.link!);
        await launchUrl(url, mode: LaunchMode.inAppWebView);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 40),
            height: 150,
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.hardEdge,
                  height: 100,
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 15),
                Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
              ]
            ), 
          ),
        ],
      ),
    );
  }
}