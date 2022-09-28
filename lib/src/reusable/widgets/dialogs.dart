import 'package:flutter/material.dart';

class WinDialog {
  late BuildContext context;

  WinDialog(this.context);

  Future<void> LoginFailed() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 150,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(
                      Icons.error,
                      size: 100,
                      color: Colors.red,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Login Failed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<void> SignUpFailed() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 150,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(
                      Icons.error,
                      size: 100,
                      color: Colors.red,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sign up Failed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<void> Welcome(String name) async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 125,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset('assets/img/check-mark-verified.gif'),
                    ),
                    Text(
                      'Welcome back $name!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<void> SuccessfulLogin() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 125,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset('assets/img/check-mark-verified.gif'),
                    ),
                    Text(
                      'Successfull Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<void> SuccessfulSignUp() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 125,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset('assets/img/check-mark-verified.gif'),
                    ),
                    Text(
                      'Successfully registered',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<void> SuccessfullySent() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              height: 125,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset('assets/img/check-mark-verified.gif'),
                    ),
                    Text(
                      'Email sent',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
