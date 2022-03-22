import 'package:flutter/cupertino.dart';

class Constant{
  static Color red = Color(0xFFCE1C1C);
  static Color maroon = Color(0xFFAC1F25);
  static Color grey = Color(0xFF858585);
  static Color yellow = Color(0xFFFFB431);

  static List<Menu> menus = [
    Menu(image: 'images/fresh_meat.png', title: 'Fresh\nMeat'),
    Menu(image: 'images/daging_sapi.png', title: 'Daging\nSapi'),
    Menu(image: 'images/daging_domba.png', title: 'Daging\nDomba'),
    Menu(image: 'images/frozen_food.png', title: 'Frozen\nFood'),
    Menu(image: 'images/sosis_sapi.png', title: 'Sosis\nSapi'),
    Menu(image: 'images/sosis_ayam.png', title: 'Sosis\nAyam'),
    Menu(image: 'images/semua_produk.png', title: 'Semua\nProduk'),
  ];

  static List<Place> places =[
    Place(title: 'Jakarta', isCheked: true),
    Place(title: 'Bandung', isCheked: false),
    Place(title: 'Bogor', isCheked: false),
    Place(title: 'Depok', isCheked: false),
    Place(title: 'Tangerang', isCheked: false),
    Place(title: 'Bekasi', isCheked: false),
  ];
}

class Menu {
  late String image;
  late String title;
  Menu({required this.image, required this.title});
}

class Place {
  late String title;
  late bool isCheked;
  Place({required this.title, required this.isCheked});
}