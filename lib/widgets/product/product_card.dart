
import 'package:flutter/material.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard(this.product,{Key key, }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState(product);
}

class _ProductCardState extends State<ProductCard> {
    String cuenta;
  String price;
  Product product;
  _ProductCardState(this.product);

  @override
  void initState() { 
    super.initState();
    shared();
    precio();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 shared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {
      cuenta = (prefs.getString('cuenta') ?? 'f');
   });
  }

 precio() async{
  setState(() {
    if(cuenta=='Mayorista'){
    print('-------------------------------------------------');
    print(product.priceM);
    price=product.priceM;
  }else{
    price=product.priceC;
  }
  });
}


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: null,
        child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width / 2 - 29,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(235, 235, 237, .8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width / 2 - 64,
                    height: MediaQuery.of(context).size.width / 2 - 64,
                    child: Image.network(
                      'http://petshome.com.mx/public_html/'+widget.product.image,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(right:10),
                  child: Text( '\$'+price),
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment(1, 0.5),
                    child: Container(
                        margin: const EdgeInsets.only(left: 16.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color:transparentPink,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Text(
                          widget.product.name,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        )),
                  ),
                )
              ],
            )));
  }
}
