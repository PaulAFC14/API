import 'package:aco/src/reusable/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../reusable/objects/user.dart';

class CartPage extends StatefulWidget {
  late User user;
  CartPage({super.key, required this.user});

  @override
  // ignore: no_logic_in_create_state
  State<CartPage> createState() => _CartPageState(user);
}

class _CartPageState extends State<CartPage> {
  late User user;
  _CartPageState(this.user);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text('Welcome Cart ${user.getName()}')
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar().buil(context, page: 3, user: user)

    );
  }
}