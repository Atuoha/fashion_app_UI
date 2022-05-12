import 'package:provider/provider.dart';
import 'provider/fashion_data.dart';
import 'screen.dart/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FashionData(),
      child: MaterialApp(
        title: 'Fashion App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
        home:  const WelcomeScreen(),
      ),
    );
  }
}
