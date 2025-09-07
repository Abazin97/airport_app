import 'package:airportapp/components/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  String selected = 'All';
  String label = 'All';

  void _applyFilter() {
    setState(() {
      if (selected == 'All') {
        
      } else if (selected == 'Important Notices') {
        
      } else if (selected == 'Flights') {
        
      } else if (selected == 'Traffic Conditions'){

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Provider.of<NavProvider>(context, listen: false).pageIndex = 0;
          }, 
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white, 
          )
        ),
        title: Text(
          'Inbox',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        ),
        actions: [
          IconButton(
            onPressed: (){

            }, 
            icon: Icon(Icons.more_horiz, 
            color: Colors.white,))
        ],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60), 
          child: SizedBox(
            height: 70,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child:  ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          filterButton('All'),
                          filterButton('Important Notices'),
                          filterButton('Flights'),
                          filterButton('Traffic Conditions')
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Text('Personalised messages will be kept for 7 days.', style: TextStyle(fontSize: 12),),
                  ))
              ],
            ),
          )),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              
            ],
          )
        ],
      ),
    );
  }

  Widget filterButton(String label) {
    bool isSelected = selected == label;
    return Padding(padding:EdgeInsetsGeometry.fromLTRB(8, 0, 8, 0) ,child:
    ElevatedButton(
      onPressed: () {
        setState(() {
          selected = label;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.yellow : Colors.white,
        textStyle: TextStyle(fontSize: 14)
      ),
      child: Text('$label ()', style: TextStyle(color: isSelected ? Colors.blue[900] : Colors.black, fontSize: 12),)
    ));
  }
}