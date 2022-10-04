import 'package:aco/src/reusable/objects/product.dart';
import 'package:aco/src/reusable/objects/stock.dart';
import 'package:aco/src/reusable/widgets/axisError.dart';
import 'package:aco/src/reusable/widgets/bottomNavBar.dart';
import 'package:aco/src/reusable/widgets/dialogs.dart';
import 'package:aco/src/reusable/widgets/headers.dart';
import 'package:aco/src/reusable/widgets/promoCard.dart';
import 'package:aco/src/reusable/widgets/roundedButton.dart';
import 'package:card_swiper/card_swiper.dart';
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
  int pageController = 1;

  _HomePageState(this.user);

  @override
  Widget build(BuildContext context) {
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
                //CARROUSEL DE PUBLICIDAD
                CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 30 * vh,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2)),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return PromoCard(context).Home(vh, vw, user, index + 1);
                  },
                ),

                SizedBox(
                  height: 2 * vh,
                ),

                //SWIPER DE CATEGORIAS
                FutureBuilder<List<dynamic>>(
                  future: Stock(user).getCats(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 5 * vh,
                        child: Swiper(
                          viewportFraction: 0.55,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 1 * vw),
                              child: WinRoundedButton(
                                      backgroundColor: pageController ==
                                              snapshot.data![index]['id']
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).backgroundColor,
                                      color: pageController ==
                                              snapshot.data![index]['id']
                                          ? Colors.white
                                          : Colors.black,
                                      txt: snapshot.data![index]['name'],
                                      height: 5 * vh,
                                      width: 0)
                                  .TextButton(context,
                                      onPressed: () {}, fontSize: 1.5 * vh),
                            );
                          },
                        ),
                      );
                    } else {
                      int ciclo = 0;

                      return Container(
                          height: 5 * vh,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1 * vh),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Theme.of(context).backgroundColor,
                                    Colors.white,
                                  ])));
                    }
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar:
              BottomNavBar().buil(context, page: 0, user: user));
    } else {
      return AxisError(context).Build();
    }
  }

  Widget pageButton(String category) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double vh = height / 100;
    double vw = width / 100;

    return WinRoundedButton(
        backgroundColor: Theme.of(context).primaryColor,
        color: Colors.white,
        txt: category,
        height: 10 * vh,
        width: 33 * vw);
  }
}
