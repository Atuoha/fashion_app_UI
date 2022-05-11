import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => WelcomeState();
}

class WelcomeState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: TextButton(
            onPressed: null,
            child: Image.asset(
              'assets/imgs/menu.png',
              width: 30,
            ),
          ),
          actions: [
            TextButton(
              onPressed: null,
              child: Image.asset(
                'assets/imgs/search.png',
                width: 30,
              ),
            )
          ],
        ),
        body: Center(child: Text(''),),
      ),
    );
  }
}
