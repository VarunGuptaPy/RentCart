import 'package:flutter/material.dart';
import 'package:rent_cart/authentication/seller/sellerAuth.dart';

import '../globals/globals.dart';

class SellerDrawer extends StatelessWidget {
  const SellerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: SizedBox(
                    height: 160,
                    width: 160,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          sharedPreferences!.getString("photoUrl")!),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  sharedPreferences!.getString("name")!,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: "Train", fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.monetization_on,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "My Earnings",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.reorder,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "New Orders",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.local_shipping,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "History - Orders",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    firebaseAuth.signOut().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => const sellerAuth())));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
