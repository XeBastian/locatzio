import 'package:flutter/material.dart';

import 'app/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const LocationApp());
}

class LocationApp extends StatelessWidget {
  const LocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locatzio',
      theme: ThemeData(useMaterial3: true, primaryColor: Colors.brown),
      home: Home(),
    );
  }
}
