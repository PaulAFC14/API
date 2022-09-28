import 'package:aco/src/reusable/widgets/roundedButton.dart';
import 'package:aco/src/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:card_swiper/card_swiper.dart';

import '../reusable/methods/routes.dart';
import '../reusable/objects/user.dart';

class SwiperBanner extends StatefulWidget {
  late User user;
  SwiperBanner({Key? key, required this.user});

  @override
  State<SwiperBanner> createState() => _SwiperBannerState(user);
}

class _SwiperBannerState extends State<SwiperBanner> {
  late User user;

  _SwiperBannerState(this.user);

  List<String> images = [
    'assets/img/swp_banner/i1.jpg',
    'assets/img/swp_banner/i2.jpg',
    'assets/img/swp_banner/i3.jpg',
  ];

  List<String> title = [
    'Elegancia en todo momento',
    'El comfort necesario para un placentero descanso',
    'Contigo en todo momento del día, buen provecho'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          actions: <Widget>[
            TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        body: _swiper(context));
  }

  _swiper(BuildContext c) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double vh = height / 100;
    double vw = width / 100;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 0 * vh),
      child: ListView(
        children: <Widget>[
          Container(
            height: 74 * vh,
            child: Swiper(
              itemBuilder: ((context, index) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: 92 * vw,
                      height: 55 * vh,
                      color: Theme.of(context).backgroundColor,
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 1 * vh),
                    Text(
                      title[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 2.5 * vh, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 1 * vh),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 1.75 * vh),
                    )
                  ],
                );
              }),
              itemCount: 3,
              pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Color.fromARGB(255, 201, 198, 198))),
            ),
          ),
          SizedBox(height: 5 * vh),
          WinRoundedButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  color: Colors.white,
                  txt: 'Get Started',
                  height: 7 * vh,
                  width: 0)
              .TextButton(context,
                  onPressed: () => Routes(context).goToHomePage(user: user),
                  fontSize: 2 * vh)
        ],
      ),
    );
  }
}
