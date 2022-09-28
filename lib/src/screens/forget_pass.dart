import 'package:aco/src/reusable/methods/filters.dart';
import 'package:aco/src/reusable/methods/routes.dart';
import 'package:aco/src/reusable/widgets/input_text.dart';
import 'package:aco/src/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../reusable/widgets/dialogs.dart';
import '../reusable/widgets/roundedButton.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final formKey = GlobalKey<FormState>();

  final mailController = TextEditingController();
  Color mailColor = Color.fromARGB(255, 233, 233, 233);
  String mail = '';
  bool empty = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double vh = height / 100;
    double vw = width / 100;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          leading: IconButton(
            onPressed: (() => Routes(context).goToLogin()),
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2 * vh, horizontal: 4 * vw),
          child: ListView(
            children: <Widget>[
              Container(
                width: width * (.6),
                height: width * (.6),
                margin: EdgeInsets.symmetric(horizontal: width * (.2)),
                child: Image.asset(
                  'assets/img/forgot_guy.png',
                ),
              ),
              SizedBox(height: 1 * vh),
              Text(
                'Forget password?',
                style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 3.5 * vh),
              ),
              SizedBox(height: 2 * vh),
              Text(
                'Don´t worry! it happens. Please enter the address associated with your account',
                style: TextStyle(fontSize: 2.3 * vh),
              ),
              SizedBox(height: 4 * vh),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputText().generateInputForm(context,
                        controller: mailController,
                        hide: false,
                        hint: 'Email',
                        width: 0,
                        height: 6 * vh,
                        marginH: 8 * vw,
                        fontsize: 2 * vh,
                        color: mailColor,
                        type: 0,
                        end: true),
                    SizedBox(height: 1 * vh),
                    InputText().EmptyLabel(context,
                        label: 'Missing email', active: empty)
                  ],
                ),
              ),
              SizedBox(height: 5 * vh),
              WinRoundedButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      color: Colors.white,
                      txt: 'Submit',
                      height: 7 * vh,
                      width: 0)
                  .TextButton(context, onPressed: submit, fontSize: 2 * vh)
            ],
          ),
        ));
  }

  submit() {
    mail = Filters().getInputValue(mailController);

    setState(() {
      mailColor = Filters().EmptyInputColor(context, mail);
      empty = Filters().EmptyInputLabel(mail);
    });

    List<String> colecctcion = [mail];
    if (Filters().checkColection(colecctcion: colecctcion)) {
      send();
    }
  }

  Future<void> send() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://crud.jonathansoto.mx/api/forgot-password'));
    request.fields.addAll({'email': mail});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      WinDialog(context).SuccessfullySent();

      Future.delayed(Duration(seconds: 2)).then((value) {
        Routes(context).goToLogin();
      });
    } else {
      print(response.reasonPhrase);
    }
  }
}
