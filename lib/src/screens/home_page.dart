import 'package:aco/src/reusable/objects/product.dart';
import 'package:aco/src/reusable/objects/stock.dart';
import 'package:aco/src/reusable/widgets/axisError.dart';
import 'package:aco/src/reusable/widgets/bottomNavBar.dart';
import 'package:aco/src/reusable/widgets/headers.dart';
import 'package:aco/src/reusable/widgets/promoCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../reusable/objects/user.dart';

class HomePage extends StatefulWidget {
  late User user;
  HomePage({super.key, required this.user});

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState(user);
}

class _HomePageState extends State<HomePage> {
  List<String> cardLinks = [];
  late User user;

  _HomePageState(this.user);


  @override
  Widget build(BuildContext context) {
    Stock myStock = Stock(user);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double vh = height / 100;
    double vw = width / 100;

    if (height > width) {
      return Scaffold(
          appBar: Headers(context).Custom1('Home'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5 * vw, vertical: 5 * vw),
            child: ListView(
              children: <Widget>[
                CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 30 * vh,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2)),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return PromoCard(context).Home(vh, vw, user, index+1);
                  },
                ),

                /*FutureBuilder(
                  future: Stock(user).getCategories(),
                  builder: (context, snapshot) {
                    return Text('${snapshot.data}');
                  },
                )*/
              ],
            ),
          ),
          bottomNavigationBar:
              BottomNavBar().buil(context, page: 0, user: user));
    } else {
      return AxisError(context).Build();
    }
  }

  
}
