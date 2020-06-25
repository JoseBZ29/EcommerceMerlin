import 'package:flutter/material.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/providers/producto_provider.dart';
import 'package:project_ecommerce/widgets/product/product_card.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final productos = new ProductoProvider();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 8.0),
          child: Text(
            'Más Productos',
            style: TextStyle(color: Colors.black, shadows: shadow),
          ),
        ),
        card(),
      ],
    );
  }

  Widget productList(products) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 200,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          return Padding(

              ///calculates the left and right margins
              ///to be even with the screen margin
              padding: index == 0
                  ? EdgeInsets.only(left: 24.0, right: 8.0)
                  : index == 4
                      ? EdgeInsets.only(right: 24.0, left: 8.0)
                      : EdgeInsets.symmetric(horizontal: 8.0),
              child: ProductCard(products[index]));
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget card() {
    return FutureBuilder(
      future: productos.getProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return productList(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
