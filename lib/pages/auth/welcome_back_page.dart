import 'package:flutter/material.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/pages/intro_page.dart';
import 'package:project_ecommerce/providers/user_provider.dart';

import 'register_page.dart';

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  TextEditingController email = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController password = TextEditingController();

  String correo;
  String pass;

  final usuario = UsuarioProvider();

    //print(email.toString());
    //print(password.toString());
    // Future
    Future login() async {
     return await usuario.buscarUsuario(correo, pass);
    }
    void runMyFuture() {
  login().then((value) {
    print('Salio Bien');
    Navigator.pushReplacementNamed(context, 'Home');
    
    // Run extra code here
  }, onError: (error) {
    print("Salio mal");
    
  });
}

  @override
  Widget build(BuildContext context) {
    Widget welcomeBack = Text(
      'Bienvenido',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget loginButton = InkWell(
      onTap: () {
        runMyFuture();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: EdgeInsets.all(10),
        child: Center(
            child: new Text("Iniciar Sesión",
                style: const TextStyle(
                    color: const Color(0xfffefefe),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0))),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(236, 60, 3, 1),
                  Color.fromRGBO(234, 60, 3, 1),
                  Color.fromRGBO(216, 78, 16, 1),
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
      ),
    );

    Widget loginForm = Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.8),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: email,
              onChanged: (val) {
                //correo=val;
                setState(() {
                  correo = val;
                });
              },
              decoration: InputDecoration(
                hintText: 'Ej: correo@gmail.com',
              ),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              onChanged: (val) {
                //pass=val;
                setState(() {
                  pass = val;
                });
              },
              controller: password,
              style: TextStyle(fontSize: 16.0),
              obscureText: true,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: loginButton,
          )
        ],
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '¿No tienes cuenta? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => RegisterPage()));
            },
            child: Text(
              'Regístrate',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg_auth.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
              color: transparentYellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(flex: 3),
                welcomeBack,
                Spacer(),
                Spacer(flex: 2),
                loginForm,
                Spacer(flex: 2),
                forgotPassword
              ],
            ),
          )
        ],
      ),
    );
  }
}
