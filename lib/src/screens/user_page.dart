import 'package:aco/src/reusable/methods/routes.dart';
import 'package:aco/src/reusable/widgets/bottomNavBar.dart';
import 'package:aco/src/reusable/widgets/headers.dart';
import 'package:aco/src/reusable/widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../reusable/objects/user.dart';

class UserPage extends StatefulWidget {
  late User user;
  UserPage({super.key, required this.user});

  @override
  // ignore: no_logic_in_create_state
  State<UserPage> createState() => _UserPageState(user);
}

class _UserPageState extends State<UserPage> {
  late User user;
  _UserPageState(this.user);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double vh = height / 100;
    double vw = width / 100;


    return Scaffold(
      appBar: Headers(context).CustomBack('Account', user),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4*vw, vertical: 3.5*vh),
        child: ListView(
          children: <Widget>[

            Container(
              width: 92*vw,
              height: 11*vh,
              padding: EdgeInsets.all(1.5*vh),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Theme.of(context).cardColor,
                    Colors.white10
                  ]
                ),
                borderRadius: BorderRadius.circular(10*vh)
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 8*vh,
                    height: 8*vh,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)
                    ),
                    child: Image.network('https://crud.jonathansoto.mx/storage/users/avatars/avantar.jpg'),
                  ),
                  SizedBox(width: 2*vw),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 1*vh,),
                        Text(
                          user.getName() + ' ' + user.getLastname(),
                          style: TextStyle(
                            fontSize: 1.75*vh,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 0.75*vh,),
                        GestureDetector(
                          child: Text(
                            'Edit Account',
                            style: TextStyle(
                              fontSize: 1.5*vh,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 3*vh,),
            //MyAccount
            WinRoundedButton(
              backgroundColor: Theme.of(context).backgroundColor, 
              color:  Colors.black, 
              txt: 'My account', 
              height: 6.75*vh, 
              width: 0).IconTextButton(
                context, 
                onPressed: () {}, 
                fontSize: 2*vh, 
                icon: Icon(Icons.person_outline_rounded, color: Color.fromARGB(255, 90, 187, 94), size: 3*vh,)
            ),
            SizedBox(height: 1.5*vh),
            WinRoundedButton(
              backgroundColor: Theme.of(context).backgroundColor, 
              color:  Colors.black, 
              txt: 'Payment', 
              height: 7*vh, 
              width: 0).IconTextButton(
                context, 
                onPressed: () {}, 
                fontSize: 2*vh, 
                icon: Icon(Icons.wallet_rounded, color: Color.fromARGB(255, 255, 185, 81), size: 3*vh,)
            ),
            SizedBox(height: 1.5*vh),
            WinRoundedButton(
              backgroundColor: Theme.of(context).backgroundColor, 
              color:  Colors.black, 
              txt: 'My address', 
              height: 7*vh, 
              width: 0).IconTextButton(
                context, 
                onPressed: () {}, 
                fontSize: 2*vh, 
                icon: Icon(Icons.location_on_outlined, color: Color.fromARGB(255, 48, 184, 248), size: 3*vh,)
            ),
            SizedBox(height: 1.5*vh),
            WinRoundedButton(
              backgroundColor: Theme.of(context).backgroundColor, 
              color:  Colors.black, 
              txt: 'Transactions', 
              height: 7*vh, 
              width: 0).IconTextButton(
                context, 
                onPressed: () {}, 
                fontSize: 2*vh, 
                icon: Icon(Icons.credit_card, color: Color.fromARGB(255, 255, 162, 81), size: 3*vh,)
            ),
            SizedBox(height: 1.5*vh),
            WinRoundedButton(
              backgroundColor: Theme.of(context).backgroundColor, 
              color:  Colors.black, 
              txt: 'Notification', 
              height: 7*vh, 
              width: 0).IconTextButton(
                context, 
                onPressed: () {}, 
                fontSize: 2*vh, 
                icon: Icon(Icons.notifications_none_rounded, color: Color.fromARGB(255, 11, 86, 147), size: 3*vh,)
            ),
            SizedBox(height: 1.5*vh),
            WinRoundedButton(
              backgroundColor: Theme.of(context).backgroundColor, 
              color:  Colors.black, 
              txt: 'Setting', 
              height: 7*vh, 
              width: 0).IconTextButton(
                context, 
                onPressed: () {}, 
                fontSize: 2*vh, 
                icon: Icon(Icons.settings_outlined, color: Color.fromARGB(255, 126, 31, 143), size: 3*vh,)
            ),
            SizedBox(height: 1.5*vh),
            WinRoundedButton(
              backgroundColor: Theme.of(context).backgroundColor, 
              color:  Colors.black, 
              txt: 'Live showroom', 
              height: 7*vh, 
              width: 0).IconTextButton(
                context, 
                onPressed: () {}, 
                fontSize: 2*vh, 
                icon: Icon(Icons.map_outlined, color: Color.fromARGB(255, 27, 110, 30), size: 3*vh,)
            ),
            SizedBox(height: 1.5*vh),
            WinRoundedButton(
              backgroundColor: Theme.of(context).cardColor, 
              color:  Theme.of(context).primaryColor, 
              txt: 'Log out', 
              height: 6*vh, 
              width: 37*vw).SingleIconTextButton(
                context, 
                onPressed: logout, 
                fontSize: 2*vh, 
                icon: Icon(Icons.logout, color: Theme.of(context).primaryColor, size: 3*vh,)
            ),
            
          ],
        ),
      ),

    );
  }

  Future<void>  logout() async{

    String token = 'Bearer ' + user.getToken();

    String email = user.getEmail();
    

    var headers = {
      'Authorization': token
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://crud.jonathansoto.mx/api/logout'));
    request.fields.addAll({
      'email': email
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());

      Future.delayed(Duration(milliseconds: 500)).then((value) {
        Routes(context).goToLogin();
      });

    }
    else {
      print(response.reasonPhrase);
      print('Error');
    }
  }
}