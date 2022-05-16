import 'package:flutter/material.dart';
import 'package:fashion_app/provider/fashion_data.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../model/fashion.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = 'single';
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = data['id'] as int;

    Fashion fashion =
        Provider.of<FashionData>(context, listen: false).findById(id);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  Provider.of<FashionData>(context, listen: false)
                      .toggleItemToFashion(id);
                });
              },
              icon: Icon(
                Provider.of<FashionData>(context, listen: false).isItemOnFav(id)
                    ? Icons.favorite_rounded
                    : Icons.favorite_border,
                color: orangeVariant,
              ),
            ),
          ],
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: orangeVariant,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(fashion.imageUrl),
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 20,
              child: Column(children: const [
                Icon(Icons.chat, color: orangeVariant),
                Text(
                  '57',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Icon(Icons.favorite_border, color: orangeVariant),
                Text(
                  '144',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Icon(Icons.share, color: orangeVariant),
                Text(
                  '980',
                  style: TextStyle(color: Colors.white),
                )
              ]),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              left: 20,
              child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: orangeVariant.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fashion.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          fashion.location,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          fashion.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
