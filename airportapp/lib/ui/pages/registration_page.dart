import 'package:airportapp/domain/auth/auth_status.dart';
import 'package:airportapp/providers/auth_notifier.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();


  final formKeyEmail = GlobalKey<FormState>();
  final formKeyPhone = GlobalKey<FormState>();
  String? birthDate;
  String? selectedMonth;
  String? selectedYear;
  String? phone;
  
  String countryCode = '+852';
  String countryIso = 'HK';
  String? titleController;
  String errorMsg = '';
  String fieldError = '';
  bool showOtpField = false;
  bool isTouched = false;

  final List<String> titles = [
    'Mr.',
    'Mrs.',
    'Ms.',
    'Miss',
  ];

  final List<String> months = [
    '01','02','03','04','05','06',
    '07','08','09','10','11','12',
  ];

  final List<String> years = List.generate(
    102,
    (index) => ((DateTime.now().year - 18) - index).toString(),
  );

  @override
  void dispose(){
    controllerEmail.dispose();
    controllerPassword.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void signUp()async{
    phone = '$countryCode${phoneController.text}';
    birthDate = '$selectedMonth/$selectedYear';
    final authNotifier = context.read<AuthNotifier>();
    await authNotifier.register(
      titleController ?? '',
      birthDate ?? '',
      nameController.text,
      lastNameController.text,
      controllerEmail.text,
      controllerPassword.text,
      phoneController.text,
    );
    
    if (authNotifier.status == AuthStatus.error) {
      _showError(authNotifier.errmsg ?? 'error');
      return;
    }
    if (!mounted) return;
    popPage();
  }

  void sendCode()async{
    // await authService.value.sendOtp(
    //   phoneNumber: "+1${phoneController.text}", 
    //   onCodeSent: (verId){
    //     setState(() {
    //       verificationId = verId;
    //       showOtpField = true;
    //     });
    //   }, 
    //   onError: (e) => debugPrint(e.toString()),
    //   onTimeout: (verId) {
    //     verificationId = verId;
    //   },
    // );
  }


  void popPage(){
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: popPage,
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.teal),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Registration',
                        style: TextStyle(color: Colors.teal, fontSize: 24),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Form(
                  key: formKeyPhone,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mobile Number (For account login)', style: TextStyle(color: Colors.teal)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                countryListTheme: CountryListThemeData(
                                  borderRadius: BorderRadius.circular(8),
                                  inputDecoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey[600]!,
                                      ),
                                    ),
                                  ),
                                ),
                                onSelect: (Country country) {
                                  setState(() {
                                    countryCode = '+${country.phoneCode}';
                                    countryIso = country.countryCode;
                                  });
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                countryCode,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (fieldError.isNotEmpty)
                        Text(
                          fieldError,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      SizedBox(height: 5),
                      if (showOtpField)
                        ElevatedButton(
                          onPressed: (){
                            if (formKeyPhone.currentState!.validate()){
                              sendCode();
                            }
                          }, 
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: Size(double.infinity, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                          child: Text('Get Verification Code', style: TextStyle(color: Colors.white),)
                        ),
                    ]
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: formKeyEmail,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showOtpField)
                          TextFormField(
                            controller: otpController,
                            decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Verification Code', hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500])),
                            validator: (String? value) {
                            if (value == null || value.trim().isEmpty){
                              return 'This is a required field.';
                            }
                            return null;
                            },
                          ),
                          SizedBox(height: 5),
                        if (showOtpField)
                          ElevatedButton(
                            onPressed: (){
                              //signIn();
                            }, 
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: Size(double.infinity, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                            child: Text('Verify', style: TextStyle(color: Colors.white),)
                          ),
                        Text('Title', style: TextStyle(color: Colors.teal)),
                        DropdownButtonFormField2<String>(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          isExpanded: true,
                          items: titles
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                      child: Text(item),
                                    ),
                                  ))
                              .toList(),
                          value: titleController,
                          onChanged: (value) {
                            setState(() {
                              titleController = value;
                            });
                          },
                          validator: (value) =>
                              value == null ? 'This is a required field.' : null,
                          buttonStyleData: ButtonStyleData(height: 40,),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                          )
                        ),
                        const SizedBox(height: 20),
                        Text('First Name', style: TextStyle(color: Colors.teal)),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty){
                              return 'This is a required field.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text('Last Name', style: TextStyle(color: Colors.teal)),
                        TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty){
                              return 'This is a required field.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text('Birthday', style: TextStyle(color: Colors.teal)),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                hint: const Text('MM'),
                                initialValue: selectedMonth,
                                items: months
                                    .map(
                                      (m) => DropdownMenuItem(
                                        value: m,
                                        child: Text(m),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() => selectedMonth = value);
                                },
                                validator: (value) =>
                                    value == null ? 'Select month' : null,
                              ),
                            ),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                hint: const Text('YYYY'),
                                initialValue: selectedYear,
                                items: years
                                    .map(
                                      (y) => DropdownMenuItem(
                                        value: y,
                                        child: Text(y),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() => selectedYear = value);
                                },
                                validator: (value) =>
                                    value == null ? 'Select year' : null,
                              ),
                            )
                          ]
                        ),
                        SizedBox(height: 20),
                        Text('Email Address', style: TextStyle(color: Colors.teal)),
                        TextFormField(
                          controller: controllerEmail,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty){
                              return 'This is a required field.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text('Password', style: TextStyle(color: Colors.teal)),
                        TextFormField(
                          controller: controllerPassword,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                          validator: (String? value) {
                            if (value == null){
                              return 'This is a required field.';
                            }
                            if (value.trim().isEmpty){
                              return 'This is a required field.';
                            }
                            return null;
                          },
                        ),
                        Text(
                          errorMsg,
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  )
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKeyEmail.currentState!.validate()){
                      signUp();
                    }
                  }, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: Size(double.infinity, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)), child: Text('Sign Up', style: TextStyle(color: Colors.white))),
              ],
            ),
          )
        ],
        
      ),
    );
  }
}