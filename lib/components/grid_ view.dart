import 'package:flutter/material.dart';
import 'package:fashion_app/model/fashion.dart';
import '../screen.dart/details_page.dart';
import 'single_item.dart';

class GridViewComponent extends StatelessWidget {
  List<Fashion> fashionList;
  GridViewComponent({required this.fashionList});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: fashionList.map((fashion) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(),
                settings: RouteSettings(arguments: {'id': fashion.id}),
              ),
            );

            // Navigator.of(context).pushNamed(DetailsPage.routeName,
            //     arguments: {'id': fashion.id});
          },
          child: SingleCard(
            id: fashion.id,
            imageUrl: fashion.imageUrl,
            name: fashion.name,
            location: fashion.location,
          ),
        );
      }).toList(),
    );
  }
}
