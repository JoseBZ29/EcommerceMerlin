import 'package:flutter/material.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/repositories/product.dart';
import 'package:project_ecommerce/repositories/productCart.dart';
import 'package:project_ecommerce/repositories/product_service.dart';

class PruebasPage extends StatefulWidget {
  PruebasPage({Key key}) : super(key: key);

  @override
  _PruebasPageState createState() => _PruebasPageState();
}

class _PruebasPageState extends State<PruebasPage> {
  List<Producto> _categoryList = List<Producto>();
  var _categoryService = ProductService();

  @override
  void initState() { 
    super.initState();
    getAllCategories();
  }


  getAllCategories() async {
    _categoryList = List<Producto>();
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Producto();
        categoryModel.nombre = category['name'];
        categoryModel.image = category['description'];
        categoryModel.id = category['id'];
        _categoryList.add(categoryModel);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: Card(
                elevation: 8.0,
                child: ListTile(
                  leading: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        //_editCategory(context, _categoryList[index].id);
                      }),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_categoryList[index].nombre),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //_deleteFormDialog(context, _categoryList[index].id);
                          })
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}