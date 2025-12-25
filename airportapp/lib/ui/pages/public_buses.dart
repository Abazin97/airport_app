import 'package:flutter/material.dart';


class PublicBuses extends StatefulWidget {
  const PublicBuses({super.key});

  @override
  State<PublicBuses> createState() => _PublicBusesState();
}

class _PublicBusesState extends State<PublicBuses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Public Bus',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close_outlined,
            color: Colors.white,
          )
        ),
        bottom: PreferredSize(preferredSize: Size.fromHeight(200), child: Container(
          height: 200,
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              Image.asset('lib/assets/citybus.jpg'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800]
                    ),
                     child: Text('From Airport', style: TextStyle(color: Colors.white),)),
                    ElevatedButton(onPressed: (){}, child: Text('To Airport')),
                    IconButton(onPressed: (){}, icon: Icon(Icons.filter_list))
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}