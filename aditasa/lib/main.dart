import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:aditasa/products_page.dart';
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes:[
    'profile',
    'email'
  ]
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage>{
  @override
  void initState(){
    super.initState();

      Timer(Duration(seconds: 5),
    () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (contect)=>SignInDemo())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600,
      child: FlutterLogo(size: MediaQuery.of(context).size.height,),

    );
  }
}

class HomeScreen extends StatelessWidget{
  //Pantalla inicio sesion
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Inicio Sesion Google')
      ),
      body: Center(
        child: Text('Bienvenido'),
      ),
    );
  }
}

class SignInDemo extends StatefulWidget{
  @override
  _SignInDemoState createState() => _SignInDemoState();

}

class _SignInDemoState extends State<SignInDemo>{
  late GoogleSignInAccount _currentUser;
  @override
  void initState(){
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Inicio sesion'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_currentUser!=null){
      return Column(
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
                identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          RaisedButton(
              onPressed: _handleSignOut,
              child: Text('Cerrar sesion')
          )
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          Text('No iniciaste sesion'),
          RaisedButton(
            onPressed:_handleSignIn,
           
            child: Text('iniciar sesion'),
          )
        ],
      );
    }
  }

  Future<void> _handleSignIn() async {
    try{
      await _googleSignIn.signIn();
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductsPage()),
      );

    }catch(error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }
}