import 'package:flutter/material.dart';

class MeatCard extends StatelessWidget {
  bool isFlash;
  bool isPromo;
  MeatCard({required this.isFlash, required this.isPromo});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: (isFlash)?310:(isPromo)?275:255,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Image(
              image: AssetImage("images/host.jpg"),
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daging Sapi Has Luar / Beef SIRLOIN Steak 50 Wagyu Steak', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis, maxLines: 2,),
                  SizedBox(
                    height: 5,
                  ),
                  (isPromo)? Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                        decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          '80%',
                          style: TextStyle(color: Colors.red, fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Rp 90.000",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12),
                      )
                    ],
                  ):SizedBox(width: 0,),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            "Rp 80.000",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          ),
                        ),
                      ),
                      (isFlash)? SizedBox(width: 10,) : SizedBox(
                        child: Text(
                          "400 Terjual",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  (isFlash)? ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        height: 8,
                        child: LinearProgressIndicator(
                          color: Colors.red,
                          value: 0.8,
                          backgroundColor: Colors.grey[100],
                        ),
                      )) : SizedBox(width: 0,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
