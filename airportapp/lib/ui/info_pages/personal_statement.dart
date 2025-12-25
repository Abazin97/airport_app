import 'package:flutter/material.dart';

class PersonalStatement extends StatelessWidget {
  const PersonalStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // мы ставим свой leading
        backgroundColor: Colors.blue[800],
        toolbarHeight: 60,
        flexibleSpace: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Центрированный заголовок
              Center(
                child: Text(
                  'Personal Information\nCollection Statement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              // Иконка слева (leading)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personal Information Collection Statement (for Baggage Arrival Notice Service) ("PICS")', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Text('Collection of Personal Data', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Text('1. The My HKG App (the "App") supports the function of the Baggage Arrival Notice Service ("Service") for passengers.\n\n\n2. You will be asked to provide data that may be used to identify you as set out below before you can use this Service. Please provide us with your consent to do so by ticking the box adjacent to the link to these terms and press the "Agree and Continue" button. The Authority will not be able to provide the Service to you if you do not provide all the data required.\n\n\n3. In supplying this Service to you, the Authority collects the following data:\n\n(a) QR code / RFID number of your luggage tag\n\n(b) Your email address\n\n(c)In respect of each luggage tag, a nickname of your choice\n\n(d) Your travel details such as flight number and the date of the flight you take each time you use the Service', style: TextStyle(fontSize: 20)),
                SizedBox(height: 30),
                Text('Purposes of Collection of Personal Data', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('4. Data collected may be used by the Authority for any one or more of the following purposes:\n\n(a) For providing the Service\n\n(b) For identification and verification purposes in connection with the Service\n\n(c) For improving the Service, or any other service that may be offered on the App\n\n(d) For informing you of any changes to the Service including discontinuance of the Service\n\n(e) For research purposes, whether or not it involves aggregation of the personal data collected from you\n\n(f) For designing further services that may be offered by the Authority, whether alone or jointly with third parties\n\n(g) For sending you the latest information about the airport and invitations to surveys and programmes e.g. the loyalty program to be set up and run by the Authority\n\n(h) For any other purposes directly relating to the purposes listed above', style: TextStyle(fontSize: 20)),
                SizedBox(height: 30),
                Text('Transfer or Disclosure of Personal Data', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('5. The Authority holds the data provided by you confidential but the Authority may provide, transfer or disclose such data or information to any one or more of the following parties (whether in or outside Hong Kong) for the purposes set out in paragraph 4 above and any other purpose listed below:\n\n(a) Any agents, contractors or third party service providers who provide administrative, telecommunications, computer or information technology services in connection with the App.\n\n(b) Any third party service providers such as air carriers, aviation security companies (such as AVSECO) or other companies who provide services to facilitate operations at the Hong Kong International Airport, or otherwise in connection with the provision of the Service.\n\n(c) Any person under a duty of confidentiality to the Authority and who has given written undertaking to keep such information confidential.\n\n(d) A third party to comply with any law, legal requirements, orders, directions or requests from any court, authority or government body of any jurisdiction, which may be in or outside Hong Kong.', style: TextStyle(fontSize: 20)),
                SizedBox(height: 30),
                Text('Retention', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('6. All personal data that has been collected from you will only be stored for a limited duration that is relevant to the purpose for which it was processed and for as long as required by applicable law.', style: TextStyle(fontSize: 20)),
                SizedBox(height: 30),
                Text('General', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('7. You have a right to:\n\n(a) Check whether the Authority holds data about you and/or access such data\n\n(b) Require the Authority to correct any data relating to you that is inaccurate\n\n8. Any request for access to your personal data or correction of your personal data should be addressed to the Authority as follows:\n\nGeneral Personal Data Officer\n\nAirport Authority Hong Kong\n\nHKIA Tower\n\n1 Sky Plaza Road\n\nHong Kong International Airport\n\nLantau, Hong Kong\n\n9. The Authority has a right to charge a reasonable fee for the processing of any personal data access request.\n\n10. ﻿﻿﻿This PICS may be amended from time to time without notice. You should review this PICS before using this Service. If at any time we decide to amend this PICS in a manner that differs materially from this PICS, you will be notified.\n\n11. In case of any inconsistency between the English version and any other versions of this PICS in other languages, the English version shall prevail.\n\n12. You have a right to withdraw your consent to the use of your personal data at any time, by writing to our General Personal Data Officer at the address stated in paragraph 8 above. However, this is likely to result in discontinuation of the Service, in which case no refund of any payment made for or in connection with the use of this Service will be given to you.', style: TextStyle(fontSize: 20)),
                SizedBox(height: 40)
              ],
            ),
          )
        ],
      ),
    );
  }
}