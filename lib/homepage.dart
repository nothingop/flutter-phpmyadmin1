import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mystore/loginform.dart';
import 'listdata.dart';

class HomePage extends StatelessWidget {
  // final String text;
  // HomePage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("Homepage"),),
        body: Padding(
      padding: EdgeInsets.all(15),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Image(image: AssetImage("images/dashboard.png")),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            width: double.infinity,
            child: Text(
              "Welcome, admin!",
              style: TextStyle(fontFamily: "Netflix", fontSize: 18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                child: Text(
                  "show Data",
                  style: TextStyle(fontFamily: "Netflix", color: Colors.white),
                ),
                onPressed: (){
                  Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                    
                },
                      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
    ),
),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                child: Text(
                  "Logout",
                  style: TextStyle(fontFamily: "Netflix",color: Colors.white),
                ),
                onPressed: (){
                  Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginForm();
                    }));
                    logout(context);
                },
                      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
    ),
    ),
          ),
        ],
      ),
    ));
  }
}

logout(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text("You have successfully logged out!"),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }