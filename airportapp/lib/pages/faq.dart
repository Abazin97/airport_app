import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  Faq({super.key});

  final List _phone = [
    'Airport Enquery Hotline',
    'Car Parks',
    'MTR Corporation Ltd',
    'Citybus Ltd. (City Flyer)',
    'Long Win Bus Co Ltd. (Airbus)',
    'New Lantao Bus Co (1973) Ltd',
    'Residents` Coaches Discovery Bay\nTransit Services Ltd.',
    'Park Island Transport Company Ltd.',
    'Airport Hotel Link',
    'The Hong Kong Society for\nRehabilitation (Hong Kong residents)',
    'The Hong Kong Society for\nRehabilitation (Overseas Visitiors)',
    'Hong Kong International Airport Ferry\nTerminal Services Limited',
    'CKS',
    'Cotai Water Jet',
    'TurboJET',
    'China Travel Service (Hong Kong)',
    'Eternal East Tours Company Limited',
    'Kwoon Chung Trans-Island',
    'S.T. Travel',
    'Transport Department'
  ];

  Widget phoneTile(int index) => Padding(
    padding: const EdgeInsets.only(left: 25, top: 7),
    child: GestureDetector(
      onTap: () {
        print('biba');
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.call_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(_phone[index]),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.phone_callback_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Divider(
                color: Colors.grey[300],
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.close, 
            color: Colors.white
          )
        ),
        centerTitle: true,
        title: Text(
          'FAQ',
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
            icon: Icon(Icons.share, 
            color: Colors.white,))
        ],
      ),
      body: ListView(
        children: [
          Image.asset('lib/images/section-banner-airport-authority.jpg'),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 25, right: 25, bottom: 40),
            child: Text('If you are looking for information on transport in and around Hong Kong, please feel free to contact the appropriate service providers. Their contact details are as follows.', style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('Hong Kong International Airport', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30),
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          phoneTile(0),
          phoneTile(1),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 40),
            child: Text('Airport Express', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25 ,top: 12),
            child: Divider(
                color: Colors.grey[300],
            ),
          ),
          phoneTile(2),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 40),
            child: Text('Bus Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25 ,top: 12),
            child: Divider(
                color: Colors.grey[300],
            ),
          ),
          phoneTile(3),
          phoneTile(4),
          phoneTile(5),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 40),
            child: Text('Residents` Coaches', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25 ,top: 12),
            child: Divider(
                color: Colors.grey[300],
            ),
          ),
          phoneTile(6),
          phoneTile(7),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 40),
            child: Text('Hotel Coach Service', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25 ,top: 12),
            child: Divider(
                color: Colors.grey[300],
            ),
          ),
          phoneTile(8),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 40),
            child: Text('Rehabus', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25 ,top: 12),
            child: Divider(
                color: Colors.grey[300],
            ),
          ),
          phoneTile(9),
          phoneTile(10),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 40),
            child: Text('Ferry Transfer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25 ,top: 12),
            child: Divider(
                color: Colors.grey[300],
            ),
          ),
          phoneTile(11),
          phoneTile(12),
          phoneTile(13),
          phoneTile(14),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 40),
            child: Text('Mainland/ Macao Coaches', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25 ,top: 12),
            child: Divider(
                color: Colors.grey[300],
            ),
          ),
          phoneTile(15),
          phoneTile(16),
          phoneTile(17),
          phoneTile(18),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 40),
            child: Text('Government Departments', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          phoneTile(19),
          SizedBox(height: 60)
        ],
      ),
      
    );
  }
}