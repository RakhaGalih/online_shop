import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_shop/login.dart';
import 'package:online_shop/constant.dart';
import 'package:online_shop/reusable/card.dart';
import 'package:online_shop/reusable/clock.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Place> places = Constant.places;
  bool _login = true;
  int _currentPage = 0;
  String _lokasi = 'Jakarta';

  void closeDialog() {
    for (int i = 0; i < places.length; i++) {
      if (places[i].isCheked) {
        setState(() => _lokasi = places[i].title);
      }
    }
  }

  Future openDialog(double width) => showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (context, setState) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text(
                'Pilih area pengiriman terdekat dari lokasi anda',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              content: Container(
                width: width,
                height: 270,
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: 210,
                      child: Scrollbar(
                        showTrackOnHover: true,
                        isAlwaysShown: true,
                        child: ListView.builder(
                          physics:
                              ScrollPhysics(parent: BouncingScrollPhysics()),
                          itemCount: places.length,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: EdgeInsets.only(
                                    bottom:
                                        (index == places.length - 1) ? 0 : 10),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                          right: 5,
                                        ),
                                        child: Icon(
                                          Icons.place,
                                          size: 20,
                                          color: Constant.red,
                                        )),
                                    Expanded(
                                      child: SizedBox(
                                        child: Text(
                                          places[index].title,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                      value: places[index].isCheked,
                                      onChanged: (value) {
                                        for (int i = 0;
                                            i < places.length;
                                            i++) {
                                          if (i == index) {
                                            setState(() =>
                                                places[i].isCheked = true);
                                          } else {
                                            setState(() =>
                                                places[i].isCheked = false);
                                          }
                                        }
                                      },
                                      checkColor: Colors.white,
                                      focusColor: Constant.red,
                                      activeColor: Constant.maroon,
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        closeDialog();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: width,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Constant.maroon,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          'Pilih',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ))));

  Future openPopUp(double width) => showDialog(
      context: context,
      builder: (context) => Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: width,
              height: 490,
              child: Stack(children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                      color: Color(0xFF202425),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/pop_up.png',
                        height: 280,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Constant.yellow,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'images/fire.png',
                              height: 12,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Promo Spesial',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(text: 'Daging '),
                                  TextSpan(
                                      text: 'Sirloin\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(text: 'berkualitas hanya di\n'),
                                  TextSpan(
                                      text: 'jawaradaging',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700)),
                                ])),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Constant.maroon,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'PESAN SEKARANG',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                            )),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.cancel,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )),
              ]),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  openDialog(width);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pilih area pengiriman',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 15,
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                              child: Icon(
                                Icons.place,
                                size: 20,
                                color: Constant.red,
                              )),
                          Text(
                            _lokasi,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                width: 25,
                height: 25,
                child: InkWell(
                  onTap: () {},
                  child: Stack(children: [
                    Icon(Icons.shopping_cart_outlined, size: 25),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.all(3),
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Constant.red),
                        ))
                  ]),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.notifications_none_outlined,
                    size: 25,
                  )),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(82),
      ),

      //body
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  height: 200,
                  child: PageView.builder(
                      physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                      controller: PageController(viewportFraction: 0.92),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            openPopUp(width);
                          },
                          child: Container(
                            child: Container(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Daging Sapi\nLokal, Fresh &\nBerkualitas',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        Text('Lihat produk',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8,
                                            ))
                                      ],
                                    )
                                  ],
                                )),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/header.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(horizontal: 5),
                          ),
                        );
                      }),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(4, (int index) {
                      return AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          height: 10,
                          width: (index == _currentPage) ? 40 : 10,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Constant.red
                                  : Constant.grey));
                    })),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.start,
                    children: List.generate(
                        Constant.menus.length + 1,
                        (index) => Padding(
                              padding: const EdgeInsets.all(15),
                              child: (index == 7)
                                  ? SizedBox(
                                      width: 70,
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            Constant.menus[index].image,
                                            width: 37,
                                            height: 37,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Constant.maroon,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 70,
                                          height: 70,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          Constant.menus[index].title,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                            )),
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Text(
                              'FLA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic),
                            ),
                            Icon(
                              Icons.flash_on,
                              color: Colors.orange,
                            ),
                            Text(
                              'H SALE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Clock(
                              text: "01",
                              isEnd: false,
                            ),
                            Clock(
                              text: "27",
                              isEnd: false,
                            ),
                            Clock(
                              text: "01",
                              isEnd: false,
                            ),
                            Clock(
                              text: "20",
                              isEnd: true,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 300,
                          child: ListView.builder(
                              physics: ScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        left: (index == 0) ? 20 : 10,
                                        right: (index == 3) ? 20 : 0,
                                        bottom: 20),
                                    child: SizedBox(
                                        width: 180,
                                        child: MeatCard(
                                          isFlash: true,
                                          isPromo: true,
                                        )));
                              }))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Produk Pilihan',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  MeatCard(isFlash: false, isPromo: true),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MeatCard(isFlash: false, isPromo: false),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  MeatCard(isFlash: false, isPromo: false),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MeatCard(isFlash: false, isPromo: true),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Untuk Kamu Pengguna Baru!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/host.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: width,
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constant.maroon,
                        boxShadow: [
                          BoxShadow(
                            color: Constant.maroon.withOpacity(0.5),
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: Offset(0, 7), // changes position of shadow
                          ),
                          BoxShadow(
                            color: Constant.maroon.withOpacity(0.6),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'images/meat.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Icon(
                      Icons.article,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
