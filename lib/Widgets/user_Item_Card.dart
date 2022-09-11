import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_cart/globals/globals.dart';
import 'package:rent_cart/main_screen/seller/rent_book/item_detail_screen.dart';

import '../models/items.dart';

class UserItemCard extends StatefulWidget {
  final Items? model;
  final BuildContext? context;

  UserItemCard({this.model, this.context});

  @override
  _UserItemCardState createState() => _UserItemCardState();
}

class _UserItemCardState extends State<UserItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ItemDetailScreen(
              model: widget.model,
            ),
          ),
        );
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          height: 100,
          width: 60,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.thumbnailUrl.toString(),
                height: 60,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.model!.title!,
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: "Train",
                      color: Colors.cyan,
                    ),
                  ),
                  Text("₹" + widget.model!.SingleDayRent.toString() + '/Day'),
                ],
              ),
              // IconButton(
              //   icon: Icon(
              //     Icons.delete,
              //     color: Colors.pinkAccent,
              //   ),
              //   onPressed: () async {
              //     await FirebaseFirestore.instance
              //         .collection('sellers')
              //         .doc(sharedPreferences!.getString('uid'))
              //         .collection('items')
              //         .doc(widget.model!.itemID)
              //         .delete();
              //     await FirebaseFirestore.instance
              //         .collection('items')
              //         .doc(widget.model!.itemID)
              //         .delete();
              //   },
              // ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
