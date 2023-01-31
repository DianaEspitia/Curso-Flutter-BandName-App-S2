import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s2_bandnameapp/pages/home.dart';
import 'package:s2_bandnameapp/pages/status.dart';
import 'package:s2_bandnameapp/services/socket_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => SocketService(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'status',
        routes: {
          'home': ( _ ) => HomePage(),
          'status': ( _ ) => const StatusPage(),
        }, 
      ),
    );
  }
}