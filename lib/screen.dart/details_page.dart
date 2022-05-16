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
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(fashion.imageUrl),
          ),
        ),
      ),
    );
  }
}
