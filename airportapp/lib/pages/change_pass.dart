import 'package:airportapp/data/shared_pref.dart';
import 'package:airportapp/providers/auth_notifier.dart';
import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChangePass extends StatefulWidget {

  //final Int64? uid;
  const ChangePass({super.key, });

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {

  TextEditingController controllerCurrentPass = TextEditingController();
  TextEditingController controllerNewPass = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerCode = TextEditingController();

  final formKey1 = GlobalKey<FormState>();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;

  String? email;
  String? phone;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

    Future<void> loadUserData() async {
    email = await SharedPref.get<String>("email");
    phone = await SharedPref.get<String>("phone");
    controllerEmail.text = email!;
    controllerPhone.text = phone!;

    setState(() {});
  }

  @override
  void dispose(){
    controllerCurrentPass.dispose();
    controllerNewPass.dispose();
    controllerEmail.dispose();
    controllerPhone.dispose();
    controllerCode.dispose();
    super.dispose();
  }

  void sendCode()async{
    final authNotifier = context.read<AuthNotifier>();
    await authNotifier.changePasswordInit(email ?? '', phone ?? '', controllerCurrentPass.text);
    showInputDialog();
  }

  void updatePassword()async{
    final authNotifier = context.read<AuthNotifier>();
    await authNotifier.changePasswordConfirm(controllerCode.text, authNotifier.getUid!, controllerEmail.text, controllerNewPass.text);
    popPage();
  }
  

  void showInputDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HKIA Verification Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Please enter the code sent to your email.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: controllerCode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Code',
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        updatePassword();
                        Navigator.pop(context);
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void popPage(){
    Provider.of<NavProvider>(context, listen: false).pageIndex = 3;
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Form(
                key: formKey1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Confirm Current Password', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: controllerCurrentPass,
                      obscureText: _obscureCurrentPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _obscureCurrentPassword = !_obscureCurrentPassword;
                            });
                          }, 
                          icon: Icon(_obscureCurrentPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        )
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Your password must contain 8 or more characters, and must contain at least 3 of the following: lowercase letters, uppercase letters, numbers, and special characters.', style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 30),
                    // ElevatedButton(
                    //   onPressed: (){
                    //     if (formKey1.currentState!.validate()){
                    //       showInputDialog();
                    //     }
                    //   }, 
                    //   style: ElevatedButton.styleFrom(
                    //     minimumSize: Size(double.infinity, 40),
                    //   ),
                    //   child: Text('Send Code', style: TextStyle(fontWeight: FontWeight.bold),)
                    // ),
                    // SizedBox(height: 40),
                    Text('Confirm New Password', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: controllerNewPass,
                      obscureText: _obscureNewPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _obscureNewPassword = !_obscureNewPassword;
                            });
                          }, 
                          icon: Icon(_obscureNewPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: (){
                  if (formKey1.currentState!.validate()){
                    sendCode();
                  }
                }, 
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                ),
                child: Text('Submit', style: TextStyle(fontWeight: FontWeight.bold),)
              )
            ],
          ),
        ),
      ),
    );
  }
}