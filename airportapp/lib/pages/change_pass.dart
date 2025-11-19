import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/pages/home_screen.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  //User? user = authService.value.currentUser;
  TextEditingController controllerCurrentPass = TextEditingController();
  TextEditingController controllerNewPass = TextEditingController();
  final formKey1 = GlobalKey<FormState>();
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;

  @override
  void dispose(){
    controllerCurrentPass.dispose();
    controllerNewPass.dispose();
    super.dispose();
  }

  void updatePassword()async{
    // final email = user?.email;
    // if (email == null){
    //   throw Exception("Email not found");
    // }
    // try {
    //   await authService.value.resetPasswordFromCurrent(
    //     currentPassword: controllerCurrentPass.text, 
    //     newPassword: controllerNewPass.text, 
    //     email: email
    //   );
    //   popPage();
    // } catch (e) {
    //   showSnackBar();
    // }
  }

  void showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Password change failed...'),
      showCloseIcon: true,
    ));
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
                    updatePassword();
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