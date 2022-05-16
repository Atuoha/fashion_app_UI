import 'package:flutter/material.dart';
import 'package:fashion_app/provider/fashion_data.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';

class SingleCard extends StatefulWidget {
  final int id;
  final String name;
  final String imageUrl;
  final String location;

  SingleCard({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.location,
  });

  @override
  State<SingleCard> createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Stack(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  widget.location,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: IconButton(
              onPressed: () {
                setState(() {
                  Provider.of<FashionData>(context, listen: false)
                      .toggleItemToFashion(widget.id);
                });
              },
              icon: Icon(
                Provider.of<FashionData>(context, listen: false)
                        .isItemOnFav(widget.id)
                    ? Icons.favorite_rounded
                    : Icons.favorite_border,
                color: orangeVariant,
              ),
            ),
          )
        ],
      ),
    );
  }
}
