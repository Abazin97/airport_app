import 'package:flutter/material.dart';

class TermsConditions1 extends StatelessWidget {
  const TermsConditions1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[800],
        toolbarHeight: 60,
        flexibleSpace: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'Terms of Conditions &\nPrivacy Policy',
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
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MyTAG', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Text('1. MyTAG enables you to use the Service on the App at Hong Kong International Airport.\n\n\n2. MyTAG is embedded with a RFID(Radio Frequency Identification) chip which can be read by baggage handling systems in use at HKIA. The RFID chip in each tag does not contain any personal information, however, it contains a unique serial number that is correlated with the data provided by you to us at the registration stage. Any personal data collected for or in connection with the Service shall begoverned by the Personal InformationCollection Statement.\n\n\n3. The RFID chip signal may be distorted or blocked by other sources of radio waves and materials, it is recommended to attach the tag to the handle and avoid placing inside baggage, or hanging it on metal baggage or oversized that exceeds 180 cm (H) 75 cm (W) x 75 cm (D).\n\n\n4. Within 30 days from its purchase date recorded on the payment receipt, if you find the tag is damaged or has any defective issues, please fill in and submit the online form to apply for returns and refunds on hkairportshop.com with information and photos of the tag.', style: TextStyle(fontSize: 20)),
                SizedBox(height: 30),
                Text('MyTAG Pro', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('1. MyTAG Pro enables you to use the Service on the App at designated airport(s) and the designated airport(s) is subject to change from time to time without notice.\n\n\n2. The Authority aims to provide the Service to you subject to these terms and conditions for an initial period of 60 months from the date of purchase of your MyTAG Pro. At any time after the said initial period, your use of the Service may be subject to additional costs and charges and/or availability of any Service or related services that the Authority procures from its supplier(s).\n\n\n3. MyTAG Pro is embedded with a Sigfox chipset so as to enable the communication between your MyTAG Pro and the system. The Sigfox chipset in each MyTAG Pro does not contain any personal information, however, it contains a unique serial number that is correlated with the data provided by you to Authority at the registration stage. Any personal data collected for or in connection with the Service shall be governed by the Personal Information Collection Statement.\n\n\n4. Within 30 days from its purchase date recorded on the payment receipt, if you find the MyTAG Pro is damaged or has any defective issues, please fill in and submit the online form for returns and refunds on hkairportshop.com with information and photos of the MyTAG Pro.\n\n\n5. Within the first 12 months from its purchase date recorded on the payment receipt, any malfunctioning MyTAG Pro may be replaced by a MyTAG Pro of the same category for free once\n\n\nUtilising Sigfox technology, MyTAG Pro covers flights between Hong Kong International Airport and 20 airports with Sigfox network (RC4) as of June 2023. The Coverage airports may be amended by Sigfox without prior notice.\n\n\n7. MyTAG Pro is a smart baggage device which can track your check-in baggage and provide real-time notifications through My HKG app of the Hong Kong International Airport. You acknowledge that MyTAG Pro is not suitable for and agree not to hand carry and only place it in your check-in baggage. You agree and undertake to switch off your MyTAG Pro device when it is not in use by you.', style: TextStyle(fontSize: 20)),
              ],
            ),
          )
        ],
      ),
    );
  }
}