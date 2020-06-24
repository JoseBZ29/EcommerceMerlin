import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/widgets/shop/shop_item_list.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  SwiperController swiperController = SwiperController();

  List<Product> products = [
    Product(
        'assets/cat_pro.png',
        'Boat roackerz 400 On-Ear Bluetooth Headphones',
        'description',
        '45.3'),
    Product(
        'assets/dog_food.png',
        'Boat roackerz 100 On-Ear Bluetooth Headphones',
        'description',
        '22.3'),
    Product(
        'assets/headphones_3.png',
        'Boat roackerz 300 On-Ear Bluetooth Headphones',
        'description',
        '58.3')
  ];
  

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'add_address');
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Continuar con el pago",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontFamily: 'Montserrat',
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkGrey),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Image.asset('assets/icons/denied_wallet.png'),
          //       onPressed: () => Navigator.of(context).push(
          //           MaterialPageRoute(builder: (_) => UnpaidPage())),
          //   )
          // ],
          title: Text(
            'Carrito de compras',
            style: TextStyle(
                color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * .65,
                  child: ListView.builder(
                    itemBuilder: (_, index) => ShopItemList(
                      products[index],
                      onRemove: () {
                        setState(() {
                          products.remove(products[index]);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    itemCount: products.length,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .25,
              child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('${products.length} Productos'),
                            trailing: Text('-10.93'),
                          ),
                          // ListTile(
                          //   title: Text('Envío'),
                          //   trailing: Text('-10.93'),
                          // ),
                          Divider(),
                          ListTile(
                            title: Text(
                              'Total',
                              style: TextStyle(
                                   fontSize: 20, color: Colors.black, fontFamily: 'Montserrat'),
                            ),
                            trailing: Text(
                              '\$ 66.93',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black, fontFamily: 'Montserrat' ),
                            ),
                          ),
                          checkOutButton
                        ],
                      ),
            ),
          ],
        )

        // LayoutBuilder(
        //   builder: (_, constraints) => SingleChildScrollView(
        //     physics: ClampingScrollPhysics(),
        //     child: ConstrainedBox(
        //       constraints: BoxConstraints(minHeight: constraints.maxHeight),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           // Container(
        //           //   padding: EdgeInsets.symmetric(horizontal: 32.0),
        //           //   height: 48.0,
        //           //   color: transparentPink,
        //           //   child: Row(
        //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           //     children: <Widget>[
        //           //       Text(
        //           //         'Subtotal',
        //           //         style: TextStyle(
        //           //             color: Colors.white,
        //           //             fontWeight: FontWeight.bold,
        //           //             fontSize: 16),
        //           //       ),
        //           //       Text(
        //           //         products.length.toString() + ' pruductos',
        //           //         style: TextStyle(
        //           //             color: Colors.white,
        //           //             fontWeight: FontWeight.bold,
        //           //             fontSize: 16),
        //           //       )
        //           //     ],
        //           //   ),
        //           // ),
        //

        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}

// class Scroll extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {

//     LinearGradient grT = LinearGradient(
//         colors: [Colors.transparent, Colors.black26],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter);
//     LinearGradient grB = LinearGradient(
//         colors: [Colors.transparent, Colors.black26],
//         begin: Alignment.bottomCenter,
//         end: Alignment.topCenter);

//     canvas.drawRect(
//         Rect.fromLTRB(0, 0, size.width, 30),
//         Paint()
//           ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

//     canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
//         Paint()..color = Color.fromRGBO(50, 50, 50, 0.4));

//     canvas.drawRect(
//         Rect.fromLTRB(0, size.height - 40, size.width, size.height),
//         Paint()
//           ..shader = grB.createShader(
//               Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return false;
//   }
// }
