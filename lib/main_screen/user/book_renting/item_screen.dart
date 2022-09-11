import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../Widgets/item_card.dart';
import '../../../models/items.dart';

class ItemScreen extends StatefulWidget {
  String? type = "";
  ItemScreen({this.type});
  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.type!,
            style: TextStyle(
              fontFamily: 'Signatra',
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('items')
                  .where('type', isEqualTo: 'Book Renting')
                  .where('itemType', isEqualTo: '${widget.type}')
                  .orderBy('timesRented', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                return snapshot.hasData == false
                    ? SliverToBoxAdapter(child: Text('No Items'))
                    : SliverStaggeredGrid.countBuilder(
                        crossAxisCount: 1,
                        staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
                        itemBuilder: (context, index) {
                          Items model = Items.fromJson(
                              snapshot.data!.docs[index].data()!
                                  as Map<String, dynamic>);
                          return ItemCard(
                            model: model,
                            context: context,
                          );
                        },
                        itemCount: snapshot.data!.docs.length);
              },
            ),
          ],
        ));
  }
}
