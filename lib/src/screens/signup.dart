import 'package:aco/src/reusable/methods/filters.dart';
import 'package:aco/src/reusable/widgets/dialogs.dart';
import 'package:aco/src/reusable/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../reusable/methods/routes.dart';
import '../reusable/widgets/roundedButton.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();

  Color nameColor = Color.fromARGB(255, 233, 233, 233);
  Color lastNameColor = Color.fromARGB(255, 233, 233, 233);
  Color emailColor = Color.fromARGB(255, 233, 233, 233);
  Color phoneColor = Color.fromARGB(255, 233, 233, 233);
  Color pass1Color = Color.fromARGB(255, 233, 233, 233);
  Color pass2Color = Color.fromARGB(255, 233, 233, 233);

  String name = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String pass1 = '';
  String pass2 = '';

  bool emptyName = false;
  bool emptyLastName = false;
  bool emptyEmail = false;
  bool emptyPhone = false;
  bool emptyPass1 = false;
  bool emptyPass2 = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double vh = height / 100;
    double vw = width / 100;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 4 * vw, vertical: 5 * vh),
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Create new Account!',
                  style: TextStyle(
                      fontSize: 3.3 * vh, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 1 * vh,
                ),
                Text(
                  'Please fill in the form continue',
                  style: TextStyle(fontSize: 1.8 * vh),
                ),
              ],
            ),
          ),
          SizedBox(height: 4 * vh),
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                InputText().generateInputForm(context,
                    controller: nameController,
                    hide: false,
                    hint: 'Name',
                    width: 0,
                    height: 6 * vh,
                    marginH: 4 * vw,
                    fontsize: 2 * vh,
                    color: nameColor,
                    type: 2,
                    end: false),
                SizedBox(height: 0.5 * vh),
                InputText().EmptyLabel(context,
                    label: 'Missing input', active: emptyName),
                SizedBox(height: 1 * vh),
                InputText().generateInputForm(context,
                    controller: lastNameController,
                    hide: false,
                    hint: 'Lastname',
                    width: 0,
                    height: 6 * vh,
                    marginH: 4 * vw,
                    fontsize: 2 * vh,
                    color: lastNameColor,
                    type: 2,
                    end: false),
                SizedBox(height: 0.5 * vh),
                InputText().EmptyLabel(context,
                    label: 'Missing input', active: emptyLastName),
                SizedBox(height: 1 * vh),
                InputText().generateInputForm(context,
                    controller: emailController,
                    hide: false,
                    hint: 'Email',
                    width: 0,
                    height: 6 * vh,
                    marginH: 4 * vw,
                    fontsize: 2 * vh,
                    color: emailColor,
                    type: 1,
                    end: false),
                SizedBox(height: 0.5 * vh),
                InputText().EmptyLabel(context,
                    label: 'Missing input', active: emptyEmail),
                SizedBox(height: 1 * vh),
                InputText().generateInputForm(context,
                    controller: phoneController,
                    hide: false,
                    hint: 'Phone',
                    width: 0,
                    height: 6 * vh,
                    marginH: 4 * vw,
                    fontsize: 2 * vh,
                    color: phoneColor,
                    type: 3,
                    end: false),
                SizedBox(height: 0.5 * vh),
                InputText().EmptyLabel(context,
                    label: 'Missing input', active: emptyPhone),
                SizedBox(height: 1 * vh),
                InputText().generateInputForm(context,
                    controller: pass1Controller,
                    hide: false,
                    hint: 'Password',
                    width: 0,
                    height: 6 * vh,
                    marginH: 4 * vw,
                    fontsize: 2 * vh,
                    color: pass1Color,
                    type: 2,
                    end: false),
                SizedBox(height: 0.5 * vh),
                InputText().EmptyLabel(context,
                    label: 'Missing input', active: emptyPass1),
                SizedBox(height: 1 * vh),
                InputText().generateInputForm(context,
                    controller: pass2Controller,
                    hide: false,
                    hint: 'Confirm password',
                    width: 0,
                    height: 6 * vh,
                    marginH: 4 * vw,
                    fontsize: 2 * vh,
                    color: pass2Color,
                    type: 2,
                    end: false),
                SizedBox(height: 0.5 * vh),
                InputText().EmptyLabel(context,
                    label: 'Missing input', active: emptyPass2),
              ],
            ),
          ),
          SizedBox(
            height: 5 * vh,
          ),
          WinRoundedButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  color: Colors.white,
                  txt: 'Sign Up',
                  height: 7 * vh,
                  width: 0)
              .TextButton(context, onPressed: goToSignUp, fontSize: 2 * vh),
          SizedBox(height: 2 * vh),
          WinRoundedButton(
                  backgroundColor: Theme.of(context).primaryColorDark,
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
                'You have an Account?',
                style: TextStyle(fontSize: 1.7 * vh),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: (() => Routes(context).goToLogin()),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 1.8 * vh),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  goToSignUp() {
    name = Filters().getInputValue(nameController);
    lastName = Filters().getInputValue(lastNameController);
    email = Filters().getInputValue(emailController);
    phone = Filters().getInputValue(phoneController);
    pass1 = Filters().getInputValue(pass1Controller);
    pass2 = Filters().getInputValue(pass2Controller);

    setState(() {
      nameColor = Filters().EmptyInputColor(context, name);
      lastNameColor = Filters().EmptyInputColor(context, lastName);
      emailColor = Filters().EmptyInputColor(context, email);
      phoneColor = Filters().EmptyInputColor(context, phone);
      pass1Color = Filters().EmptyInputColor(context, pass1);
      pass2Color = Filters().EmptyInputColor(context, pass2);

      emptyName = Filters().EmptyInputLabel(name);
      emptyLastName = Filters().EmptyInputLabel(lastName);
      emptyEmail = Filters().EmptyInputLabel(email);
      emptyPhone = Filters().EmptyInputLabel(phone);
      emptyPass1 = Filters().EmptyInputLabel(pass1);
      emptyPass2 = Filters().EmptyInputLabel(pass2);
    });

    if (pass1 == pass2) {
      List<String> collection = [name, lastName, email, phone, pass1];
      if (Filters().checkColection(colecctcion: collection)) {
        signUp(collection);
      }
    }
  }

  Future<void> signUp(List<String> collect) async {
    var headers = {
      'Cookie':
          'XSRF-TOKEN=eyJpdiI6IlFwc0NualBKcUMwWS9Sckh3YVpIbEE9PSIsInZhbHVlIjoidkZ3Wkp0WDFEeFRwUjRDek0xUGY2V0FHVm9oQ3FabEJ3MGlFSkxSakhJZGpENzJFckl5NS93dDFjUTZQZEhTSGUzU1hrcUQ5ZDY3WUZEZC9VdS9BMW1lcU9odzVhOE15a0tjUGVBZVB5OWJCYjVRUEE0WHViUjhEeCtva3N0M3EiLCJtYWMiOiJmMGUyNjJhMjBhMDQyZGExMDVlYzc1ZmUwOGMxN2IwMmVlOTI3ZWI3ZWZkZTA4OGVlN2RhMjIzMGY4NWU4YTM5IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImY4MHczQ2JwUG5MOExZeEtINHZtdkE9PSIsInZhbHVlIjoiNElxMXVHYzZPZmovUmkzTGlrb0hSalVubHAwd05iV0VDSTBFeVpXNGJLdVJxQk1JRDhUaTdwWjh5TjdoSXZNSVNyZVJIWFp2M3U4SmJJWGVOZks4SG9lZC9XSWhiLzJ4azM4WE91VkE1dlNaL0huNDV2OWlxMmRWcDlycUtLakoiLCJtYWMiOiIwZmQ1NGJjMmRhMGYwOWIyZGE1Yzk2OWRkMDIyMjBjNmEyYWEzOWRmZTJiNGZmZGQ3NTI3MjQ5ZTRmYjk1NzhkIiwidGFnIjoiIn0%3D'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://crud.jonathansoto.mx/api/register'));
    request.fields.addAll({
      'name': collect[0],
      'lastname': collect[1],
      'email': collect[2],
      'phone_number': collect[3],
      'created_by': 'paul flores',
      'role': 'Usuario',
      'password': collect[4],
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());

      WinDialog(context).SuccessfulSignUp();
      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.pop(context);
        Routes(context).goToLogin();
      });
    } else {
      print(response.reasonPhrase);
      WinDialog(context).SignUpFailed();

      Future.delayed(Duration(seconds: 2)).then((value) {
        Navigator.pop(context);
      });
    }
  }
}
