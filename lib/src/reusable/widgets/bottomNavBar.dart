import 'package:aco/src/reusable/methods/routes.dart';
import 'package:flutter/material.dart';

import '../objects/user.dart';

class BottomNavBar {
  Widget buil(BuildContext context, {required int page, required User user}) {
    double hg = MediaQuery.of(context).size.height;
    double vh = hg / 100;

    return Container(
      margin: EdgeInsets.only(bottom: 1.5*vh),
      width: double.infinity,
      height: 6 * vh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //Home
          IconButton(
              onPressed: () => Routes(context).goToHomePage(user: user),
              icon: Icon(Icons.home_filled,
                  color: page == 0
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor)),

          //Favs
          IconButton(
              onPressed: () => Routes(context).goToFavsPage(user: user),
              icon: Icon(Icons.favorite,
                  color: page == 1
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor)),

          //Dash
          Container(
            width: 5.5 * vh,
            height: 5.5 * vh,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: page == 2
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).backgroundColor),
            child: IconButton(
                onPressed: () => Routes(context).goToDashPage(user: user),
                icon: Icon(
                  Icons.space_dashboard_rounded,
                  color:
                      page == 2 ? Colors.white : Theme.of(context).primaryColor,
                  size: 24,
                )),
          ),

          //Cart
          IconButton(
              onPressed: () => Routes(context).goToCartPage(user: user),
              icon: Icon(Icons.shopping_bag_rounded,
                  color: page == 3
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor)),

          //User
          IconButton(
              onPressed: () => Routes(context).goToUserPage(user: user),
              icon: Icon(Icons.person_rounded,
                  color: page == 4
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).disabledColor)),
        ],
      ),
    );
  }
}
