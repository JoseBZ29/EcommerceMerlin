import 'dart:convert';
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

}