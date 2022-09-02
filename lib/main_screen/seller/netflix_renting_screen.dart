// import 'package:flutter/material.dart';
//
// class NetflixRentingScreen extends StatefulWidget {
//   const NetflixRentingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NetflixRentingScreen> createState() => _NetflixRentingScreenState();
// }
//
// class _NetflixRentingScreenState extends State<NetflixRentingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: InkWell(
//             child: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.cyan, Colors.amber],
//                 ),
//               ),
//               height: 60.0,
//               width: MediaQuery.of(context).size.width,
//               alignment: Alignment.center,
//               child: const InkWell(
//                 child: Text(
//                   "My Items",
//                   maxLines: 2,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40,
//                     fontFamily: "Signatra",
//                     letterSpacing: 2,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//             child: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (c) => ItemsUploadScreen(
//                             value: widget.value,
//                           )));
//             },
//             child: Text('Click to add new Item'),
//           ),
//         )),
//         StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('sellers')
//               .doc(sharedPreferences!.getString('uid'))
//               .collection('items')
//               .where('type', isEqualTo: 'Book Renting')
//               .snapshots(),
//           builder: (context, snapshot) {
//             return snapshot.hasData == false
//                 ? SliverToBoxAdapter(child: Text('No New Items'))
//                 : SliverStaggeredGrid.countBuilder(
//                     crossAxisCount: 1,
//                     staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
//                     itemBuilder: (context, index) {
//                       Items model = Items.fromJson(snapshot.data!.docs[index]
//                           .data()! as Map<String, dynamic>);
//                       return ItemCard(
//                         model: model,
//                         context: context,
//                       );
//                     },
//                     itemCount: snapshot.data!.docs.length);
//           },
//         ),
//       ],
//     );
//   }
// }
