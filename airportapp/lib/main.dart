import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/providers/auth_notifier.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:airportapp/pages/load_screen.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NavProvider(),
      ),
      FutureProvider(
        create: (_) => AuthService.create(), 
        initialData: null,
      ),
      ChangeNotifierProxyProvider<AuthService?, AuthNotifier?>(
        create: (_) => null,
        update: (_, authService, _) {
          if (authService == null){
            return null;
          }
          return AuthNotifier(authService);
        },
      ),
    ],
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadScreen(),
    );
  }
}
