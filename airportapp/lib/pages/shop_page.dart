import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    Icons.document_scanner,
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shopTile('Shop', Icons.shopping_bag_outlined),
                    shopTile('Dine', Icons.dining_outlined),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shopTile('HKairport\nRewards', Icons.card_giftcard_rounded),
                    shopTile('My Favourites', Icons.bookmark_outline)
                  ],
                )
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
                    Text(name),
                  ],
                ),
              ))
          ],
        ),
      ),
    );
  }
}