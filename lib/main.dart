import 'package:flutter/material.dart';
import 'package:fashion_app/screen.dart/details_page.dart';
import 'package:provider/provider.dart';
import 'provider/fashion_data.dart';
import 'screen.dart/welcome_screen.dart';

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
        home: const WelcomeScreen(),
        routes: {
          DetailsPage.routeName: (context) => DetailsPage(),
        },
      ),
    );
  }
}
