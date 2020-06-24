import 'dart:convert';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {

  UsuarioProvider();  
  String url ='petshome.com.mx';

  Future<Usuario> buscarUsuario(String usuario, String pass)async{
    print(usuario);
    print(pass);
   final http.Response response = await http.post(
    'https://www.petshome.com.mx/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user': usuario,
      'pass': pass
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("Llego");
    return Usuario.fromJsonMap(json.decode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  }

}