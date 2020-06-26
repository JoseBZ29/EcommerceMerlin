class Products {
  List<Product> items = new List();
  Products();
  Products.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final producto = new Product.fromJsonMap(item);
      items.add(producto);
    }
  }
}

class Product {
  String cantidad;
  String image;
  String image2;
  String image3;
  String name;
  String description;
  String priceC;
  String marca;
  String categoria;
  String clave;
  String departamento;
  String priceM;
  String id;
  String price;

  Product(this.image, this.name, this.description, this.price,this.cantidad);

  //Product(this.image, this.name, this.description, this.price);

  Product.fromJsonMap(Map<String, dynamic> json) {
    cantidad = '0';
    image = json['imagen_1'];
    image2 = json['imagen_2'];
    image3 = json['imagen_3'];
    name = json['nombre'];
    description = json['DESCRIPCION'];
    price = json['PRECIO 1'];
    priceC = json['PRECIO 1'];
    priceM=json['PRECIO 2'];
    marca = json['marca'];
    categoria=json['CATEGORIA'];
    clave=json['CLAVE'];
    departamento=json['DEPARTAMENTO'];
    id=json['id_producto'];
  }
}
