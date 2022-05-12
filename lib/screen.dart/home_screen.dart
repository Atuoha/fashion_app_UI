import 'package:fashion_app/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Recommended',
              style: TextStyle(
                color: orangeVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('New Models'),
            Text('Recent 2022 Shows')
          ],
        )
      ],
    );
  }
}
