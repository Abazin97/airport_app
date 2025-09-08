import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/data/database.dart';
import 'package:airportapp/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Shop & Dine',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50), 
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onTap: () {
                              context.read<NavProvider>().pageIndex = 6;
                            },
                            onChanged: (value) {
                              setState(() {
                  
                              });                                   
                            },
                            onSubmitted: (value) {
                              setState(() {
                                
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'e.g. Brand, Category, Location',
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                              border: InputBorder.none,
                              isCollapsed: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('What are you looking for?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shopTile('Shop', Icons.shopping_bag_outlined),
                      shopTile('Dine', Icons.dining_outlined),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shopTile('HKairport\nRewards', Icons.card_giftcard_rounded),
                    shopTile('My Favourites', Icons.bookmark_outline)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Text('Highlights & Promotions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    itemCount: Database.tileNamesShop.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () async{
                          final _url = Uri.parse(Database.tileLinksShop[index]);
                          await launchUrl(_url, mode: LaunchMode.inAppWebView);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              height: 140,
                              width: 270,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[200],
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    Database.imageShop[index],
                                    fit: BoxFit.cover,
                                  ),
                                ]
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(Database.tileNamesShop[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                          ],
                        ),
                      );
                    }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Text('You may also like', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    itemCount: Database.tileNamesShop.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => Database.tileWidgetList[index]));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[200],
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    Database.smallTileImageShop[index],
                                    fit: BoxFit.cover,
                                  ),
                                ]
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  Text(Database.smallTileNamesShop[index], textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 20),
                  child: Text('Explore the exclusive shop & dine options near you now!', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60, bottom: 80),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Please turn on Bluetooth and Location Services',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[700], fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          overlayColor: Colors.blue[900],
                          minimumSize: Size(double.infinity, 40),
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Refresh',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.refresh,
                              color: Colors.blue[900],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget shopTile(String name, IconData icon){
    return GestureDetector(
      onTap: (){
        Provider.of<NavProvider>(context, listen: false).pageIndex = 6;
      },
      child: Container(
        width: 160,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            )
          ]
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.yellow[500],
              )
            ),
            Expanded(
              flex: 10,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(icon, color: Colors.blue[900],),
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ))
          ],
        ),
      ),
    );
  }
}