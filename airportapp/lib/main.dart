import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/providers/auth_notifier.dart';
import 'package:airportapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:airportapp/pages/load_screen.dart';
import 'package:provider/provider.dart';


final authService = AuthService();
final authNotifier = AuthNotifier(authService);

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await authService.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NavProvider(),
      ),
      Provider(create: (_) => AuthService()),
      ChangeNotifierProvider(
        create: (context) {
          final authService = context.read<AuthService>();
          final notifier = AuthNotifier(authService);
          notifier.init();
          return notifier;
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
