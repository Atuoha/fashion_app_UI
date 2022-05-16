import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/grid_ view.dart';
import '../model/fashion.dart';
import '../provider/fashion_data.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    List<Fashion> fashionList =
        Provider.of<FashionData>(context, listen: false).favoriteFashionList;

    return Expanded(
      child: Consumer<FashionData>(
        builder: (_, fashion, _a) => fashionList.isEmpty
            ? Center(
                child: Column(
                  children: [
                    Image.asset('assets/imgs/oops.jpg'),
                    const SizedBox(height: 10),
                    const Text(
                      'Nothing on Favorites!',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )
            : GridViewComponent(fashionList: fashionList),
      ),
    );
  }
}
