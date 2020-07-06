
import 'package:book_club/screens/signup/localwidgets/signupForm.dart';
import "package:flutter/material.dart";

class OurSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Expanded(child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                BackButton(),
              ],
            ),
          SizedBox(
            height: 20,
          ),OurSignupForm()],
          padding: EdgeInsets.all(20.0),),)
      ],),
      
    );
  }
}