import 'package:aco/src/screens/forget_pass.dart';
import 'package:aco/src/screens/home_page.dart';
import 'package:aco/src/screens/signup.dart';
import 'package:aco/src/screens/swiper_banner.dart';
import 'package:aco/src/splash/splash.dart';
import 'package:flutter/material.dart';

import '../../screens/cart_page.dart';
import '../../screens/dash_page.dart';
import '../../screens/favs_page.dart';
import '../../screens/login.dart';
import '../../screens/user_page.dart';
import '../objects/user.dart';

class Routes {
  late BuildContext context;

  Routes(this.context);

  goToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const LoginScreen())));
  }

  goToSignUp() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const SignUp())));
  }

  goToForgotPass() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const ForgetPassScreen())));
  }

  goToSwiper({required User user}) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => SwiperBanner(user: user))));
  }

  goToHomePage({required User user}) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => HomePage(user: user))));
  }

  goToFavsPage({required User user}) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => FavsPage(user: user))));
  }

  goToDashPage({required User user}) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => DashPage(user: user))));
  }

  goToCartPage({required User user}) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => CartPage(user: user))));
  }

  goToUserPage({required User user}) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => UserPage(user: user))));
  }
}
