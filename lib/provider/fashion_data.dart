import 'package:flutter/foundation.dart';
import '../model/fashion.dart';

class FashionData extends ChangeNotifier {
  Fashion findById(int id) {
    return fashionList.firstWhere((fashion) => fashion.id == id);
  }

  bool isItemOnFav(int id) {
    return favoriteFashionList.any((fashion) => fashion.id == id);
  }

  void toggleItemToFashion(int id) {
    Fashion fashionData = fashionList.firstWhere((fashion) => fashion.id == id);

    if (isItemOnFav(id)) {
      //remove
      favoriteFashionList.remove(fashionData);
    } else {
      //add
      favoriteFashionList.add(fashionData);
    }
    notifyListeners();
  }

  List<Fashion> favoriteFashionList = [];

  List<Fashion> fashionList = [
    Fashion(
      1,
      'assets/imgs/img1.jpg',
      'Jane Doe',
      'Paris',
      'A model who is very fit in terms of health and other financial matters and has good taste for clothes',
    ),
    Fashion(
      2,
      'assets/imgs/img2.jpg',
      'Mercy Doe',
      'New York',
      'Mercy is well-groomed with very good taste of fashion and clothes as well as travelling globally.',
    ),
    Fashion(
      3,
      'assets/imgs/img3.jpg',
      'Brown Doe',
      'London',
      'Brown maintains a positive and healthy lifestyle everytime and spreads good energy to fellow cohorts',
    ),
    Fashion(
      4,
      'assets/imgs/img4.jpg',
      'Juliet Doe',
      'Brussels',
      'Juliet is a force to reckon with. She has won several awards in the fashion industry including the recent Fobes Woman.',
    ),
    Fashion(
      5,
      'assets/imgs/img5.jpg',
      'Beatrice Doe',
      'Paris',
      'A 21st Century model who is very fit in terms of health and other financial matters and has good taste for clothes',
    ),
    Fashion(
      6,
      'assets/imgs/img6.jpg',
      'Kaisy Doe',
      'Tokyo',
      'She is very sassy and well-groomed with very good taste of fashion and clothes as well as travelling globally.',
    ),
    Fashion(
      7,
      'assets/imgs/img7.jpg',
      'Diana Doe',
      'Berlin',
      'Berlin poses are out of this world. She maintains a good lifestyle everytime and spreads good energy to fellow cohorts',
    ),
    Fashion(
      8,
      'assets/imgs/img8.jpg',
      'Janet Doe',
      'Accra',
      'Janet is a force to reckon with. She has won several awards in the fashion industry including the recent Fobes Woman.',
    ),
  ];
}
