class ProductID{
  String nombre;

  ProductID(this.nombre,);

  ProductID.fromJsonMap(Map<String, dynamic> json){
    nombre = json['nombre'];
  }
}