import 'package:flutter/material.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/pages/view_product_page.dart';
import 'package:project_ecommerce/providers/producto_provider.dart';
import 'package:project_ecommerce/providers/provider_servicios.dart';

class DataSearch extends SearchDelegate {
  String selected;
  final productoProvider= ProductoProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future:
      productoProvider.buscarProducto(query.toUpperCase()),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          
          final productos = snapshot.data;
          return ListView(
            children: productos.map((producto){
              return ListTile(
                leading: Icon(Icons.data_usage),
                title: Text(producto.name),
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) =>  ViewProductPage(product: producto,)));
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

