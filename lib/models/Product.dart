import 'dart:collection';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final color;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imgUrl,
    @required this.color,
  });
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p3',
      title: 'Желтый взрыв счастья',
      description: ' Ты получишь настоящее удовольствие, когда попробуешь!',
      price: 15.99,
      imgUrl:
          'https://images.unsplash.com/photo-1574891548685-3e13f565419a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p1',
      title: 'Весенне пробуждение',
      description: 'Ты получишь настоящее удовольствие, когда попробуешь!',
      price: 77.99,
      imgUrl:
          'https://images.unsplash.com/photo-1587888637140-849b25d80ef9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80',
      color: '0xFFBBDEFB',
    ),
    Product(
      id: 'p2',
      title: 'Летний обалдеоз',
      description: 'Ты получишь настоящее удовольствие, когда попробуешь!!',
      price: 99.99,
      imgUrl:
          'https://ic.pics.livejournal.com/lily_rocha/66809270/244334/244334_600.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p4',
      title: 'Зеленый обморок',
      description: ' Ты получишь настоящее удовольствие, когда попробуешь!',
      price: 35.99,
      imgUrl:
          'https://www.baconismagic.ca/wp-content/uploads/2018/02/Cuba-libre-cocktail-recipe-720x720.jpg',
      color: '0xFFCCFF90',
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  getElementById(String id) => _items.singleWhere((value) => value.id == id);
}
