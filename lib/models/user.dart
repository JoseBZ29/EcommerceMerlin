import 'package:shared_preferences/shared_preferences.dart';

class Usuario{
  String correo;
  String tipoCuenta;
  String nombre;

  Usuario(this.correo, this.tipoCuenta, this.nombre,);

  incrementCounter(String cuenta, String nombre) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //int counter = (prefs.getInt('counter') ?? 0) + 1;
  await prefs.setString('cuenta', cuenta);
  await prefs.setString('nombre', nombre);
}

  Usuario.fromJsonMap(List<dynamic> json){
    for (var item in json) {
      //print(item['email']);
      correo=item['email'];
      tipoCuenta=item['tipo_cuenta'];
      nombre=item['usuario'];
      print(correo);
      incrementCounter(tipoCuenta,nombre);
    }
  }
}