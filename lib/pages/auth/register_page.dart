import 'package:flutter/material.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:http/http.dart' as http;

import 'forgot_password_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nombre = TextEditingController();
  TextEditingController apellidoPaterno = TextEditingController();
  TextEditingController apellidoMaterno = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController correoElectronico = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void addData() {

    var url = "petshome.com.mx/productos";

   

    http.post(url, body: {
      "nombre": nombre.text,
      "aPaterno": apellidoPaterno.text,
      "aMaterno": apellidoMaterno.text,
      "telefono": telefono.text,
      "correoElectronicp": correoElectronico.text,
      "password": password.text,
      
      
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget register = Text(
      '¡Regístrate!',
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

    Widget registerButton = InkWell(
      onTap: () {
        addData();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: EdgeInsets.all(10),
        child: Center(
            child: new Text("Aceptar",
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

    Widget registerForm = Container(
      height: 600,
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
              controller: nombre,
              decoration: InputDecoration(
                hintText: 'Nombre(s)',
              ),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: apellidoPaterno,
              decoration: InputDecoration(
                hintText: 'Apellido Paterno',
              ),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: apellidoMaterno,
              decoration: InputDecoration(
                hintText: 'Apellido Materno',
              ),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: telefono,
              decoration: InputDecoration(
                hintText: 'Teléfono',
              ),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: correoElectronico,
              decoration: InputDecoration(
                hintText: 'Correo Electrónico',
              ),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'Contraseña',
              ),
              style: TextStyle(fontSize: 16.0),
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: confirmPassword,
              decoration: InputDecoration(
                hintText: 'Confirmar Contraseña',
              ),
              style: TextStyle(fontSize: 16.0),
              obscureText: true,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: registerButton,
          )
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
                register,
                Spacer(),
                Spacer(flex: 2),
                registerForm,
                Spacer(flex: 4),
              ],
            ),
          )
        ],
      ),
    );
  }
}
