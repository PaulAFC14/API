import 'dart:convert';
import 'dart:ffi';

import 'package:aco/src/reusable/objects/user.dart';
import 'package:aco/src/reusable/widgets/axisError.dart';
import 'package:http/http.dart' as http;
import 'package:aco/src/reusable/methods/filters.dart';
import 'package:aco/src/reusable/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../reusable/methods/routes.dart';
import '../reusable/widgets/dialogs.dart';
import '../reusable/widgets/roundedButton.dart';
import 'dart:convert' show json, utf8;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final userController = TextEditingController();
  final passController = TextEditingController();

  Color userColor = Color.fromARGB(255, 233, 233, 233);
  Color passColor = Color.fromARGB(255, 233, 233, 233);

  String user = '';
  String pass = '';

  bool emptyUser = false;
  bool emptyPass = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double vh = height / 100;
    double vw = width / 100;

    if (height > width) {
      return Scaffold(
          body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 10 * vh),
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //WELCOME TEXT
                            Padding(
                              padding: EdgeInsets.only(bottom: 1 * vh),
                              child: Text('Welcome Back!',
                                  style: TextStyle(fontSize: 3 * vh)),
                            ),

                            //INSTRUCTION TEXT
                            Text('Please sign in to your account',
                                style: TextStyle(
                                    fontSize: 4 * vh,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        SizedBox(
                          height: 4 * vh,
                        ),
                        Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                InputText().generateInputForm(context,
                                    controller: userController,
                                    hide: false,
                                    hint: 'Email or Phone Number',
                                    width: 0,
                                    height: 6 * vh,
                                    marginH: 8 * vw,
                                    fontsize: 2 * vh,
                                    color: userColor,
                                    type: 0,
                                    end: false),
                                SizedBox(height: 0.5 * vh),
                                InputText().EmptyLabel(context,
                                    label: 'Missing email or phone',
                                    active: emptyUser),
                                SizedBox(height: 1.5 * vh),
                                InputText().generateInputForm(context,
                                    controller: passController,
                                    hide: true,
                                    hint: 'Password',
                                    width: 0,
                                    height: 6 * vh,
                                    marginH: 8 * vw,
                                    fontsize: 2 * vh,
                                    color: passColor,
                                    type: 2,
                                    end: true),
                                SizedBox(height: 0.5 * vh),
                                InputText().EmptyLabel(context,
                                    label: 'Missing password',
                                    active: emptyPass),
                              ],
                            )),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.zero,
                          child: TextButton(
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: (() => Routes(context).goToForgotPass()),
                            child: Text('Forget Password?',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 1.8 * vh)),
                          ),
                        ),
                        SizedBox(
                          height: 5 * vh,
                        ),
                        WinRoundedButton(
                                backgroundColor: Theme.of(context).primaryColor,
                                color: Colors.white,
                                txt: 'Sign in',
                                height: 7 * vh,
                                width: 0)
                            .TextButton(context,
                                onPressed: goToLogin, fontSize: 2 * vh),
                        SizedBox(height: 2 * vh),
                        WinRoundedButton(
                                backgroundColor:
                                    Theme.of(context).primaryColorDark,
                                color: Colors.white,
                                txt: 'Sign in with Google',
                                height: 7 * vh,
                                width: 0)
                            .ImgTextButton(context,
                                onPressed: (() {}),
                                fontSize: 2 * vh,
                                path: 'assets/img/google.png'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Don´t have an Account?',
                              style: TextStyle(fontSize: 1.7 * vh),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  primary: Theme.of(context).primaryColor),
                              onPressed: (() => Routes(context).goToSignUp()),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 1.8 * vh),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )));
    } else {
      return AxisError(context).Build();
    }
  }

  goToLogin() {
    user = Filters().getInputValue(userController);
    pass = Filters().getInputValue(passController);

    setState(() {
      userColor = Filters().EmptyInputColor(context, user);
      passColor = Filters().EmptyInputColor(context, pass);
      emptyUser = Filters().EmptyInputLabel(user);
      emptyPass = Filters().EmptyInputLabel(pass);
    });

    List<String> colecctcion = [user, pass];
    if (Filters().checkColection(colecctcion: colecctcion)) {
      print('LOGIN');
      login();
    }
  }

  Future<void> login() async{
    var request = http.MultipartRequest('POST', Uri.parse('https://crud.jonathansoto.mx/api/login'));
    request.fields.addAll({
      'email': user,
      'password': pass
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> answer = json.decode(await response.stream.bytesToString());
      dynamic data = answer['data'];
      
      int id = data['id'];
      String name = data['name'];
      String lastname = data['lastname'];
      String email = data['email'];
      String phone = data['phone_number'];
      print(phone);
      String token = data['token'];

      User userData = User(name: name, lastname: lastname, email: email, phone: phone, token: token);

      WinDialog(context).Welcome(userData.getName());

      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.pop(context);
        Routes(context).goToSwiper(user: userData);
      });

    }
    else {
      WinDialog(context).LoginFailed();

      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.pop(context);
      });
    }

  }

  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userController.dispose();
    passController.dispose();
  }
}
