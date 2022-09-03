import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_cart/Widgets/subscription_card.dart';
import 'package:rent_cart/models/subscription.dart';

import '../../../globals/globals.dart';
import '../../../models/items.dart';

class SubscriptionItemDetailScreen extends StatefulWidget {
  final Subscription? model;
  SubscriptionItemDetailScreen({this.model});
  @override
  State<SubscriptionItemDetailScreen> createState() =>
      _SubscriptionItemDetailScreenState();
}

class _SubscriptionItemDetailScreenState
    extends State<SubscriptionItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber,
                Colors.cyan,
              ],
            ),
          ),
        ),
        title: Text(
          widget.model!.title!,
          style: const TextStyle(
            fontFamily: "Signatra",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'title:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.title!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Rent Per Day:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.SingleDayRent!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Rent Per Week:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.SingleWeekRent!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Single Month Rent:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.SingleMonthRent!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Status:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.status!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Time Rent:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.timesRented!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Type of Item:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.type!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Till Day:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.rentTillDay!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Till Month:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.rentTillMonth!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Till Year:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.model!.rentTillYear!.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('sellers')
                    .doc(sharedPreferences!.getString('uid'))
                    .collection('items')
                    .doc(widget.model!.itemID)
                    .delete();
                await FirebaseFirestore.instance
                    .collection('items')
                    .doc(widget.model!.itemID)
                    .delete();
                Navigator.pop(context);
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
                    "Delete this item",
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
