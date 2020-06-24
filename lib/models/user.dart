class Usuario{
  String correo;
  String tipoCuenta;
  String nombre;

  Usuario(this.correo, this.tipoCuenta, this.nombre,);

  Usuario.fromJsonMap(List<dynamic> json){
    for (var item in json) {
      //print(item['email']);
      correo=item['email'];
      tipoCuenta=item['tipo_cuenta'];
      nombre=item['usuario'];
      print(correo);
    }
  }
}