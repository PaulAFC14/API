import 'package:aco/src/reusable/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../reusable/objects/user.dart';

class DashPage extends StatefulWidget {
  late User user;
  DashPage({super.key, required this.user});

  @override
  // ignore: no_logic_in_create_state
  State<DashPage> createState() => _DashPageState(user);
}

class _DashPageState extends State<DashPage> {
  late User user;
  _DashPageState(this.user);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text('Welcome Dash ${user.getName()}')
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar().buil(context, page: 2, user: user)

    );
  }
}