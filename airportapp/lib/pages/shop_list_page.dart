import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/pages/mcdonalds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShopListPage extends StatefulWidget {
  const ShopListPage({super.key});

  @override
  State<ShopListPage> createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue[800],
            expandedHeight: 160,
            floating: true,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Provider.of<NavProvider>(context, listen: false).pageIndex = 2;
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
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(top: kToolbarHeight + MediaQuery.of(context).padding.top, bottom: 10),
                child: Column(
                  children: [
                    Row(
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
                                    autofocus: true,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child:  ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            filterButton('All'),
                            filterButton('Shop'),
                            filterButton('Dine'),
                            filterButton('Entertainment')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index){
                return shopTile('name', 'location', 'logo', Mcdonalds());
            }))
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

  Widget shopTile(String name, String location, String logo, Widget link){
    return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (context) => link));
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            height: 80,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.grey),
                ),
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}