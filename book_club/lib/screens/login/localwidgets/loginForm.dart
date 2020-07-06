import 'package:book_club/screens/home/home.dart';
import 'package:book_club/screens/signup/signup.dart';
import 'package:book_club/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:book_club/widgets/ourContainer.dart';
import 'package:provider/provider.dart';

class OurLoginForm extends StatefulWidget {
  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {

  TextEditingController _emailController= TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString = await _currentUser.loginUserWithEmail(email, password);
      if (_returnString == "success"){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>HomeScreen())
        ); 
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
              "Log In", 
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor, 
              fontSize: 25, 
              fontWeight: FontWeight.bold,)
              ,)),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                hintText: "Email")),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline,),
                  hintText: "Password"
                ),
                ),
          SizedBox(height: 20,),
          RaisedButton(
            onPressed: () { 
              _loginUser(_emailController.text, _passwordController.text, context);
              
                           },
                          child: Padding(
                            child: Text("Log In", style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),),
                            padding: EdgeInsets.symmetric(horizontal: 100),),
                        ),
                        FlatButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onPressed: () { 
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => OurSignup(),));
                           },
                          child:Text("Don't have an account? Sign up here."),)
                      ],
                    ),
                    
                  );
                }
              
                
}