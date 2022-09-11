import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_cart/globals/globals.dart';
import 'package:rent_cart/models/items.dart';

import 'item_detail_screen_field.dart';

class ItemDetailScreenUser extends StatefulWidget {
  final Items? model;
  ItemDetailScreenUser({this.model});

  @override
  State<ItemDetailScreenUser> createState() => _ItemDetailScreenUserState();
}

class _ItemDetailScreenUserState extends State<ItemDetailScreenUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber, Colors.cyan],
            ),
          ),
        ),
        title: Text(
          widget.model!.title.toString(),
          style: TextStyle(
            fontFamily: 'Signatra',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                widget.model!.thumbnailUrl!,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                widget.model!.thumbnailUrl2!,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                widget.model!.thumbnailUrl3!,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            ItemDetailScreenField('title:', widget.model!.title.toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Short Description:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.shortInfo!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Description:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.LongDescription!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            ItemDetailScreenField(
                'rent per day:', widget.model!.SingleDayRent.toString()),
            ItemDetailScreenField(
                'rent per week:', widget.model!.SingleWeekRent.toString()),
            ItemDetailScreenField(
                'rent per month:', widget.model!.SingleMonthRent.toString()),
            ItemDetailScreenField(
                'real price of book:', widget.model!.FullPrice.toString()),
            ItemDetailScreenField(
                'item Type:', widget.model!.itemType.toString()),
            ItemDetailScreenField(
                'seller Name:', widget.model!.sellerName.toString()),
            ItemDetailScreenField('status:', widget.model!.status.toString()),
            ItemDetailScreenField('title:', widget.model!.title.toString()),
            InkWell(
              onTap: () async {
                //go to place order screen
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.amber, Colors.cyan],
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
