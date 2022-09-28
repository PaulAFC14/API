import 'package:aco/src/reusable/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../reusable/objects/user.dart';

class FavsPage extends StatefulWidget {
  late User user;
  FavsPage({super.key, required this.user});

  @override
  // ignore: no_logic_in_create_state
  State<FavsPage> createState() => _FavsPageState(user);
}

class _FavsPageState extends State<FavsPage> {
  late User user;
  _FavsPageState(this.user);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text('Welcome favs ${user.getName()}')
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar().buil(context, page: 1, user: user)

    );
  }
}