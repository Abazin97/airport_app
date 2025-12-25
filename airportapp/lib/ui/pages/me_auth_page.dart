import 'package:airportapp/components/me_screen/cell.dart';
import 'package:airportapp/components/me_screen/cell_item.dart';
import 'package:airportapp/data/shared_pref.dart';
import 'package:airportapp/providers/auth_notifier.dart';
import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/ui/pages/home_screen.dart';
import 'package:airportapp/ui/pages/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeAuthPage extends StatefulWidget {
  const MeAuthPage({super.key});
  

  @override
  State<MeAuthPage> createState() => _MeAuthPageState();
}


class _MeAuthPageState extends State<MeAuthPage> {

  String? firstName;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    firstName = await SharedPref.get<String>("firstName");

    setState(() {});
  }

  void logout()async{
      try {
        final authNotifier = context.read<AuthNotifier>();
        await authNotifier.logout();
        await SharedPref.remove();
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
    }

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
            height: MediaQuery.of(context).size.height + 270,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    color: Color(0xFF051E57),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 18, right: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Hi $firstName,', style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Quicksand')),
                                  IconButton(
                                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile())), 
                                    icon: Icon(Icons.account_circle_outlined, color: Colors.white)
                                  ),
                                ]
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile())), 
                                    icon: Icon(Icons.document_scanner, color: Colors.white)
                                  ),
                                  IconButton(
                                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile())), 
                                    icon: Icon(Icons.qr_code_scanner, color: Colors.white)
                                  ),
                                ]
                              )
                            ],
                          ),
                          SizedBox(height: 20),
// Point count system below needs to be realised later
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Point Balance',
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        '|',
                                        style: TextStyle(color: Colors.white, fontSize: 24),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'HKIA Dollar',
                                            style: TextStyle(color: Colors.white, fontSize: 16),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Icon(Icons.info, color: Colors.white, size: 16),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('0', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                      Icon(Icons.connecting_airports_outlined, color: Colors.white, size: 30),
                                      Text('\$0', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text('Point History >', style: TextStyle(color: Colors.white))),
                                      SizedBox(width: 25),
                                      Text('|', style: TextStyle(color: Colors.white, fontSize: 24)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 35), backgroundColor: Colors.yellow),  child: Text('Use now', style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),)),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Bonus Rewards', 
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        )
                                      ), 
                                      GestureDetector(
                                        onTap: () {},
                                        child: Icon(Icons.info, size: 16),
                                      ),
                                    ]
                                  ),
                                  Text('You have spent HK\$0'),
                                  SizedBox(height: 30),
                                  Text('Spend HK\$50,000 more to unlock'),
                                  Text('10,000 bonus points (=HK\$200)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  SizedBox(height: 3),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text('Calculate your rewards >', style: TextStyle(color: Colors.blue, fontSize: 12)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('What`s New', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                          ),
                          SizedBox(height: 30),
                          OutlinedButton(onPressed: (){
                            logout();
                          }, 
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40), 
                            side: BorderSide(color: Color(0xFF360EE8))
                          ), 
                          child: Text('Log out', style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold))),
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