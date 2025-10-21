import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:share_plus/share_plus.dart';

class Faq extends StatelessWidget {
  Faq({super.key});

  final Map<String, String> _phone = {
    'Airport Enquery Hotline': '+85221818888',
    'Car Parks': '+85221834360',
    'MTR Corporation Ltd': '+85228818888',
    'Citybus Ltd. (City Flyer)': '+85228730818',
    'Long Win Bus Co Ltd. (Airbus)': '+85222612791',
    'New Lantao Bus Co (1973) Ltd': '+85229849848',
    'Residents` Coaches Discovery Bay\nTransit Services Ltd.': '+85236512345',
    'Park Island Transport Company Ltd.': '+85229468888',
    'Airport Hotel Link': '+85227389500',
    'The Hong Kong Society for\nRehabilitation (Hong Kong residents)': '+85228178154',
    'The Hong Kong Society for\nRehabilitation (Overseas Visitiors)': '+85281008655',
    'Hong Kong International Airport Ferry\nTerminal Services Limited': '+85222153232',
    'CKS': '+85228591669',
    'Cotai Water Jet': '+85223599990',
    'TurboJET': '+85228593333',
    'China Travel Service (Hong Kong)': '+85225225560',
    'Eternal East Tours Company Limited': '+85235591083',
    'Kwoon Chung Trans-Island': '+85222612636',
    'S.T. Travel': '+85231979312',
    'Transport Department': '+85228042600'
  };

  Widget phoneTile(int index) => Padding(
    padding: const EdgeInsets.only(left: 25, top: 7),
    child: GestureDetector(
      onTap: () async{
        await FlutterPhoneDirectCaller.callNumber(_phone.entries.elementAt(index).value);
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.call_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(_phone.entries.elementAt(index).key),
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
            onPressed: ()async{
              final urlPreview = 'https://www.hongkongairport.com/apps/contentPage?pageId=local_transport_faq';
              await SharePlus.instance.share(ShareParams(text: 'I would like to share "FAQ" with you.\n\nClick here for details: $urlPreview', subject: 'I would like to share "FAQ" with you.'));
            }, 
            icon: Icon(Icons.share, 
            color: Colors.white,))
        ],
      ),
      body: ListView(
        children: [
          Image.asset('lib/assets/section-banner-airport-authority.jpg'),
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