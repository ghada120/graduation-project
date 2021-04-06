import 'package:flutter/material.dart';
import 'SignUp.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  SafeArea(
          child:MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
enum AuthMode {Login}
class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState>_formKey =GlobalKey();
  final GlobalKey<FormState>_FormKey =GlobalKey();
  AuthMode _authMode =AuthMode.Login;
  Map<String, String>_authData ={
    'email':'',
    'password':'',
  };

  final _passwordController =TextEditingController();
  bool passwordVisiable=true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "  Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height:40 ),
            Row(
              children: <Widget>[
                Text(
                  "     Email",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                    // labelText:"Email",
                    hintText: "    Your Email",
                      contentPadding: const EdgeInsets.all(20)
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val){
                    if(val.isEmpty || !val.contains("@"))
                    {
                      return "please enter a valid email address";
                    }return null;
                  },
                  onSaved:(val){
                    _authData ['email'] =val;
                    print(_authData ['email']);
                  } ,
                ),
              ),
            ),
            SizedBox(height:20 ),
            Row(
              children: <Widget>[
                Text(
                  "     Password",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Form(
              key: _FormKey,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                    // labelText:"Password",
                    hintText: "    Your password",
                      contentPadding: const EdgeInsets.all(20),
                    suffixIcon:IconButton(icon: Icon(passwordVisiable?Icons.visibility:Icons.visibility_off),
                        onPressed: (){
                          setState(() {
                            passwordVisiable =!passwordVisiable;
                          });
                        }
                    ),
                  ),
                  controller: _passwordController,
                  obscureText: !passwordVisiable,
                  validator: (val){
                    if(val.isEmpty || val.length<7)
                    {
                      return " Password must be at least 7 characters ";
                    }return null;
                  },
                  onSaved:(val){
                    _authData ['password'] =val;
                    print(_authData ['password']);
                  } ,
                ),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.black,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal:90 ,vertical:18 ),
              onPressed: _submit,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "        Don't have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                FlatButton(
                  onPressed:() =>_jump(context),
                  child: Text(
                    "Sign Up now!",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
//TODO:TRY TO MINIMIZE
  void _submit() {
    if(!_formKey.currentState.validate()) {
      return; //invalid
    };
    if(!_FormKey.currentState.validate()){
      return;
    };
    _formKey.currentState.save();
    _FormKey.currentState.save();
  }

  void _jump(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(
          builder: (_){
            return SignUp();
          }
      ),
    );
  }
}
