import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_cart/main_screen/user/book_renting/item_screen.dart';

import '../../../globals/globals.dart';

class BookRentingScreenUser extends StatefulWidget {
  const BookRentingScreenUser({Key? key}) : super(key: key);

  @override
  State<BookRentingScreenUser> createState() => _BookRentingScreenUserState();
}

class _BookRentingScreenUserState extends State<BookRentingScreenUser> {
  List<dynamic> BookTypes = [];
  // Widget? Card() {
  //   return ListView.builder(
  //     itemCount: BookTypes.length,
  //     itemBuilder: (context, index) => Container(
  //       height: 300,
  //       width: MediaQuery.of(context).size.width,
  //       child: InkWell(
  //         onTap: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (c) => ItemScreen(
  //                         type: BookTypes[index].toString(),
  //                       )));
  //         },
  //         splashColor: Colors.amber,
  //         child: Padding(
  //           padding: EdgeInsets.all(5.0),
  //           child: Container(
  //             height: 315,
  //             width: MediaQuery.of(context).size.width,
  //             child: Column(
  //               children: [
  //                 Divider(
  //                   height: 4,
  //                   thickness: 3,
  //                   color: Colors.grey[300],
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(10.0),
  //                   child: Image.asset(
  //                     'image/${BookTypes[index].toString()}.png',
  //                     height: 200,
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 4.0,
  //                 ),
  //                 Text(
  //                   '${BookTypes[index].toString()}',
  //                   style: const TextStyle(
  //                     fontSize: 20,
  //                     fontFamily: "Train",
  //                     color: Colors.cyan,
  //                   ),
  //                 ),
  //                 Divider(
  //                   height: 4,
  //                   thickness: 3,
  //                   color: Colors.grey[300],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('BookTypes')
        .doc('BookType')
        .get()
        .then((value) {
      setState(() {
        BookTypes = value.data()!['types'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: BookTypes.length,
      itemBuilder: (context, index) => Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => ItemScreen(
                          type: BookTypes[index].toString(),
                        )));
          },
          splashColor: Colors.amber,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              height: 315,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Divider(
                    height: 4,
                    thickness: 3,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset(
                      'image/${BookTypes[index].toString()}.png',
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    '${BookTypes[index].toString()}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Train",
                      color: Colors.cyan,
                    ),
                  ),
                  Divider(
                    height: 4,
                    thickness: 3,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
