import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';

class ShopItemList extends StatefulWidget {
  final Product product;
  final Function onRemove;

  ShopItemList(this.product, {Key key, this.onRemove}) : super(key: key);

  @override
  _ShopItemListState createState() => _ShopItemListState();
}

class _ShopItemListState extends State<ShopItemList> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      child: Card(
        elevation: 5,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 100,
              width: 100,
              child: Image.asset(widget.product.image),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.product.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontFamily: "Monsterrat",
                          fontStyle: FontStyle.normal),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Cantidad: 1',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Monsterrat",
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '\$${widget.product.price}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontFamily: "Monsterrat",
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showCustomDialogWithImage(context);
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: EdgeInsets.only(right: 20, top: 20),
                    child: Icon(
                      LineIcons.close,
                      size: 25,
                      color: Colors.grey,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showCustomDialogWithImage(BuildContext context) {
    Dialog dialogWithImage = Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        height: 200.0,
        width: 200.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Text(
                "¿Eliminar este producto del carrito?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Expanded(child: Text(widget.product.name))
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: RaisedButton(
                      color: Color.fromRGBO(223, 223, 223, 3),
                      onPressed: widget.onRemove,
                      child: Text(
                        'Eliminar',
                        style: TextStyle(fontSize: 18.0, color: Colors.black, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: Color.fromRGBO(223, 223, 223, 3),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(fontSize: 18.0, color: Colors.black, fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => dialogWithImage);
  }
}
