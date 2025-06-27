import 'package:flutter/material.dart';

class TermsConditions2 extends StatelessWidget {
  const TermsConditions2({super.key});

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
              children: [
                Text('Terms and Conditions for the Use of Baggage Arrival Notice Service with MyTAG PRO devices ("tag series")', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('1. The tag series enable you to use the Baggage Arrival Notice Service (the "Service") on the My HKG App of the Hong Kong International Airport (the "App").\n\n\n2. The tag series devices are subject to separate and additional terms and conditions at Terms and Conditions (hkairportshop.com).\n\n\n3. You agree that the tag series and Service are designed to help you locate your check-in baggage in the airport. By using the tag series devices access the Service, you agree to use them only for this purpose and in accordance with all applicable laws and regulations, including but not limited to those applicable to the destinations of your use.\n\n\n4.You must first complete the registration and set-up process according to the instructions given on the App. Before you travel, please follow the steps shown on the App for use of the Service.\n\n\n5. You will also require an Internet connection to be able to use the Service. Provision and maintenance of such Internet connection is not part of the Service which the Airport Authority (Authority) provides. The Authority shall not be liable for the unavailability, interruption or error of any type of Internet connection.\n\n\n6. Please also make sure that notification function of your phone is activated.\n\n\n7. A tag series device may only be replaced once. For the avoidance of doubt, there is no replacement for a replacement MyTag or MyTag Pro (as appropriate).\n\n\n8. For replacements or refunds, please fill in and submit the online form to apply for returns and refunds on hkairportshop.com with information and photos of the tag.\n\n\n9. Without limitation to any other provisions in these terms and conditions, the total payment for all claims arising out of or in connection with the tag series shall not exceed its original purchase price, save for claims in respect of death or personal injury.\n\n\n10. In case of any dispute, the Authority reserves the right to make the final decision which shall be binding on you.\n\n\n11. To the maximum extent permitted by law, in no event will the Authority be liable for direct, indirect, incidental, special, punitive loss or damage including loss of profit, loss of revenue, data loss and loss of use resulting from or in any way connected with any defect in the tag series or from any use or performance of the tag series or the Service or any delay or inability to use the tag series, Service or other related products and services, whether in contract, tort, negligence, strict liability or otherwise, even if the Authority or any of its suppliers has been advised of the possibility of such loss or damages.\n\n\n12. The Services are provided "as is" without warranty or condition of any kind. The Authority do not make any representation, give any warranty(expressed or implied), guarantee or condition that this Service is accurate, suitable, complete, current, timely, reliable, available, secure and free from bugs or viruses. All implied warranties or implied terms including but not limited to those of merchantability, fitness for particular purpose or non-infringement are fully disclaimed.\n\n\n13. The tag series and related products, software, Service and related information included in or available through this MyHKG app may include inaccuracies or typographical errors. Changes are periodically made to the information herein.\n\n\n14. The Authority reserves the right to change these terms and conditions at any time. The Authority also reserves the right to align the Service with airport operations and business on an ongoing basis.\n\n\n15. The Authority reserves the right, in its sole discretion, to terminate your access to and/or use of the Service and the related services or any portion thereof at any time for any reason without notice including but not limited to termination of MyTAG Pro networking by the Authority`s supplier(s). Notwithstanding the foregoing, where termination is deemed necessary by the Authority for reasons relating to airport operations and business, the Service will be terminated after at least 1 month`s prior notice to you, which shall be deemed received by you upon such notice being published or displayed on the App and/or sent to your registered email address.\n\n\n16. These terms and conditions are governed by the laws of Hong Kong Special Administrative Region of the People`s Republic of China ("HKSAR") and you hereby consent to the exclusive jurisdiction and venue of courts in HKSAR in all disputes arising out of or relating to the use of the Service.\n\n\n17. In case of any inconsistency between the English version and any other versions of these Terms and Conditions in other languages, the English version shall prevail.', style: TextStyle(fontSize: 20))
              ],
            ),
          )
        ],
      ),
    );
  }
}