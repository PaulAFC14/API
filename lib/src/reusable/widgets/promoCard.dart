import 'dart:math';

import 'package:aco/src/reusable/objects/stock.dart';
import 'package:aco/src/reusable/widgets/roundedButton.dart';
import 'package:flutter/material.dart';

import '../objects/product.dart';
import '../objects/user.dart';

class PromoCard{
  late BuildContext context;
  PromoCard(this.context);

  Widget Home(double vh, double vw, User user, int index){
    Random random = Random();
    late int randomNumber = random.nextInt(66) + 10;

    return GestureDetector(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(2*vh)
        ),
        child: Padding(
          padding: EdgeInsets.all(3*vw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'New collection with',
                style: TextStyle(
                  fontSize: 3*vh
                )
              ),
              SizedBox(height: .5*vh),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 44*vw,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 1.5*vh),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '$randomNumber',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 3.25*vh,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  '% discount',
                                  style: TextStyle(
                                    fontSize: 2.5*vh,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5*vh),
                          WinRoundedButton(
                            backgroundColor: Theme.of(context).primaryColor, color: Colors.white, 
                            txt: 'Shop now', height: 2.5*vh, width: 20*vw)
                            .TextButton(context, onPressed: () {}, fontSize: 1.9*vh)
                        ],
                      ),
                    ),
                    Container(
                      width: 40*vw,
                      height: 22.9*vh,
                      color: Theme.of(context).backgroundColor,
                      child: FutureImg(user, index)
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        
    
      ),
    );
  }
  
  FutureBuilder FutureImg(User user, int index){
    

    return FutureBuilder<Product>(
      future: Stock(user).getSpecificProduct(index),
      builder: (context, AsyncSnapshot<Product> snapshot) {
        if(snapshot.hasData){
          return Image.network(
            snapshot.data!.getCover(),
            fit: BoxFit.cover,
          );
          
        }else{
          return CircularProgressIndicator();
        }

      },
    );

  }

}