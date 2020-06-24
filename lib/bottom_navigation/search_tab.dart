import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/pages/view_product_page.dart';
import 'package:project_ecommerce/providers/producto_provider.dart';
import 'package:project_ecommerce/widgets/common/search_bar.dart';
import 'package:project_ecommerce/widgets/shopping_cart_icon.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final productoProvider= ProductoProvider();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Column(
        children: <Widget>[
          _appBar(),
          SearchBar(),
          //_categoryList(),
          FutureBuilder(
      future:
      productoProvider.getProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
            final productos = snapshot.data;
            return _productList(productos, context);
        } else {
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    ),
        ],
      )),
    );
  }
}

Widget _crearLista(List products){
  return ListView.builder(
    itemCount: products.length,
    itemBuilder: (BuildContext context,int index){
      return _productList(products, context);
    },
  );
}

Widget _productList(List products,context) {
  return Expanded(
      child: GridView.count(
    crossAxisCount: 2,
//    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 10.0,
    children: List<Widget>.generate(products.length, (index) {
      return GridTile(child: _productoCard(products[index], context));
    }),
  ));
}

Widget _productoCard(Product product, context) {
  return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ViewProductPage(
                product: product,
              ))),
      child: Container(
        padding: EdgeInsets.all(0),
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            elevation: 5,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Image.network(
                          'http://petshome.com.mx/public_html/'+product.image,
                          fit: BoxFit.fitWidth,
                          width: 150,
                          height: 150,
                        ),),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Text((product.name),
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1),
                    child: Text('\$ ${product.price}',
                        style: TextStyle(
                            color: (Color(0xFF0dc2cd)),
                            fontFamily: 'Roboto-Light.ttf',
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            )),
      ));
}

Widget _categoryList() {
  return Container(
    width: double.infinity,
    height: 120,
    padding: EdgeInsets.all(15),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (_, index) {
        return Card(
          elevation: 2.0,
          child: new Container(
            width: 150,
            alignment: Alignment.center,
            child: new Text('categoría $index'),
          ),
        );
      },
    ),
  );
}

Widget _appBar() {
  return Container(
    padding: EdgeInsets.only(top: 20, bottom: 20),
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Busca productos',
              style: TextStyle(fontSize: 20),
            )),
        Spacer(),
        ShoppingCartIcon()
      ],
    ),
  );
}
