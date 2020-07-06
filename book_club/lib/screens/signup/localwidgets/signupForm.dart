
import 'package:book_club/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:book_club/widgets/ourContainer.dart';
import 'package:provider/provider.dart';

class OurSignupForm extends StatefulWidget {
  @override
  _OurSignupFormState createState() => _OurSignupFormState();
}

class _OurSignupFormState extends State<OurSignupForm> {

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();


Future<void> _signUpUser (
  String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);


    try {
      String _returnString = await _currentUser.signUpUser(email, password);
     if (_returnString == "success") {
       Navigator.pop(context);
     }
     else{
        Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(_returnString),
                  duration: Duration(seconds: 2),)
                );
     }
    } catch (e) {
      print(e);
    }

  }

  


 @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding:EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Text(
              "Sign Up", 
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor, 
              fontSize: 25, 
              fontWeight: FontWeight.bold,)
              ,)),
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: "Full Name")),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email,),
                  hintText: "Email"
                ),
                ),
          SizedBox(height: 20,),
          TextFormField(
            controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "Password")),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline,),
                  hintText: "Confirm Password"
                ),
                ),
          SizedBox(height: 20,),
          
          RaisedButton(
            onPressed: () { 
              if (_passwordController.text == _confirmPasswordController.text){
                _signUpUser(_emailController.text, _passwordController.text, context);
              }
              else{
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Passwords do not match'),
                  duration: Duration(seconds: 2),)
                );
              }
             },
            child: Padding(
              child: Text("Sign Up", style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20),),
              padding: EdgeInsets.symmetric(horizontal: 100),),
          ),
         
        ],
      ),
      
    );
  }
}
