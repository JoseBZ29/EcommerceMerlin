import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_ecommerce/pages/check_out_page.dart';

class ShoppingCartIcon extends StatefulWidget {
  ShoppingCartIcon({Key key}) : super(key: key);

  @override
  _ShoppingCartIconState createState() => _ShoppingCartIconState();
}

class _ShoppingCartIconState extends State<ShoppingCartIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
             Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => CheckOutPage())); 
          },
          child: Container(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              LineIcons.shopping_cart,
              size: 30,
            ),
          ),
    );
  }
}