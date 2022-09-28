import 'package:flutter/material.dart';

class AxisError{
  late BuildContext context;

  AxisError(this.context);

  Widget Build(){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.screen_rotation_outlined,
              size: 80,
            ),
            SizedBox(height: 10,),
            Text(
              'HORIZONTAL AXIS IS NOT AVAILABLE',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            Text('Please rotate your smartphone to vertical axis')
          ],
        ),
      )
    );
  }
  

}