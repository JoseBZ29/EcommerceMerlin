import 'dart:convert';
import 'package:project_ecommerce/models/productID.dart';

import '../models/product.dart';
import 'package:http/http.dart' as http;

class ProductoProvider {

  String url ='petshome.com.mx';

  Future <List<Product>> getProducts() async{ 
    final uri = Uri.https(url, '/productos');
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final productos = new Products.fromJsonList(decodedData);
    //print(productos.items[0].name); 
    return productos.items;
  }

  Future<List<Product>> buscarProducto(String query)async{
    final uri = Uri.https(url, '/productos/$query');
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final productos = new Products.fromJsonList(decodedData);
    //print(productos.items[0].name); 
    return productos.items;
  }

  Future<Product> getProduct(String query)async{
    print('-----------------------------------------entro al get product---------------------------------------');
    final uri = Uri.https(url, '/productos/$query');
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final producto = new Product.fromJsonMap(decodedData);
    print('------------------------------aqui es------------------------');
    print(producto); 
    return producto;
  }
  Future<Product> getProductos(String query)async{
    print('-----------------------------------------entro al get product---------------------------------------');
    final uri = Uri.https(url, '/productos/$query');
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final producto = new Product.fromJsonMap(decodedData[0]);
    print('------------------------------aqui es------------------------');
    print(producto.name); 
    print(producto.id); 
    return producto;
  }

}