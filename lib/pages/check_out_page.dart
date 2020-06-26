import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/pages/view_product_page.dart';
import 'package:project_ecommerce/providers/producto_provider.dart';
import 'package:project_ecommerce/widgets/shop/shop_item_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';
import '../models/product.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  SwiperController swiperController = SwiperController();
  //ProductoProvider p = new ProductoProvider();

  File jsonFile;
  int total = 0;
  Directory dir;
  List<Product> list2 = [];
  String fileName = "shoppingCart.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;
  String cuenta;
  @override
  void initState() {
    super.initState();
    print(list2);
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
      fileContent.forEach((key, value) {
        getProductos(key, key, value);
      });
      print(list2);
    });
  }

  Future<Product> getProductos(String query, value, cantidad) async {
    final uri = Uri.https('petshome.com.mx', '/productos/$query');
    final resp = await http.get(uri);
    final decodedData = json.decode(resp.body);
    final producto = new Product.fromJsonMap(decodedData[0]);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      cuenta = prefs.getString('cuenta');
      print(producto.image);
      if (cuenta == 'Mayotista') {
        total += int.parse(producto.priceM) * int.parse(cantidad.toString());
        list2.add(new Product(producto.image, producto.name, value,
            producto.priceM, cantidad.toString()));
      } else {
        total += int.parse(producto.priceC) * int.parse(cantidad.toString());
        list2.add(new Product(producto.image, producto.name, value,
            producto.priceC, cantidad.toString()));
      }
    });
    print(list2);
    return producto;
  }

  deleteToFile(String key,price,cantidad) {
    print('Price:'+price.toString());
    print('Cantidad'+cantidad.toString());
    int elemTot=int.parse(price.toString())*int.parse(cantidad.toString());
    print(elemTot);
    setState(() {
      total=total-elemTot;
      print('--------------------------total---------------------');
      print(total);
    });
    print('Deleto to file!');
    Map<String, dynamic> jsonFileContent =
        json.decode(jsonFile.readAsStringSync());
    jsonFileContent.remove(key);
    jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  Widget productLists(List<Product> products, context) {
    return ListView.builder(
      itemBuilder: (_, index) => ShopItemList(
        products[index],
        onRemove: () {
          print(products[index].price);
            if (cuenta == 'Mayorista') {
              setState(() {
                deleteToFile(products[index].description,products[index].price,products[index].cantidad);

              products.remove(products[index]);
              });
            } else {
              setState(() {
                deleteToFile(products[index].description,products[index].price,products[index].cantidad);

              products.remove(products[index]);
              });
            }
          
          Navigator.of(context).pop();
        },
      ),
      itemCount: products.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'add_address');
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * .05,
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
                  child: productLists(list2, context),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .25,
              child: Column(
                children: <Widget>[
                  // ListTile(
                  //   title: Text('Envío'),
                  //   trailing: Text('-10.93'),
                  // ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Montserrat'),
                    ),
                    trailing: Text(
                      '\$ ' + total.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  checkOutButton
                ],
              ),
            ),
          ],
        ));
  }
}
