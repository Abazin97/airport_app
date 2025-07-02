import 'package:airportapp/components/me_screen/cell.dart';
import 'package:airportapp/components/me_screen/cell_item.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          onPressed: () {
            Provider.of<NavProvider>(context, listen: false).pageIndex = 0;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text('Me', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue[600],
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Text('HKairportRewards', style: TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'Quicksand')),
                          SizedBox(height: 60),
                          Text('Welcome!', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('Register to enjoy personalised services!', style: TextStyle(color: Colors.white)),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(350, 50)
                            ),
                            onPressed: () {}, 
                            child: Text('Join now', style: TextStyle(fontWeight: FontWeight.bold),)
                          ),
                          SizedBox(height: 60),
                          Text('Already a member of HKairport Rewards, MyHKG or HKairportShop.com?', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                          SizedBox(height: 15),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(350, 50),
                              side: BorderSide(color: Colors.white)
                            ),
                            onPressed: () {}, 
                            child: Text('Log in', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
                        ],
                      ),
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sign up to enjoy\nexceptional privileges', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 15),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final items = CellItem.getCellList();
                                return Cell(item: items[index]);
                              },),
                          )
                        ],
                      ),
                    ),
                ))
              ]
            )
          )
        ],
      ),
    );
  }
}