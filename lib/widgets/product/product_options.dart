import 'dart:io';
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/pages/check_out_page.dart';
import 'package:project_ecommerce/repositories/database_connection.dart';
import 'package:project_ecommerce/repositories/product.dart';
import 'package:project_ecommerce/repositories/productCart.dart';
import 'package:project_ecommerce/repositories/product_service.dart';
import 'package:project_ecommerce/repositories/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shop_bottomSheet.dart';

class ProductOption extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Product product;
  final int cantidad;

  const ProductOption(this.scaffoldKey, {Key key, this.product, this.cantidad})
      : super(key: key);

  @override
  _ProductOptionState createState() => _ProductOptionState();
}

class _ProductOptionState extends State<ProductOption> {
  File jsonFile;
  Directory dir;
  String fileName = "shoppingCart.json"; //yo le cambio si quiero alv
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductService productService = ProductService();

    void createFile(
        Map<String, dynamic> content, Directory dir, String fileName) {
      print("Creating file!");
      File file = new File(dir.path + "/" + fileName);
      file.createSync();
      fileExists = true;
      file.writeAsStringSync(json.encode(content));
    }

    void writeToFile(String key, dynamic value) {
      print("Writing to file!");
      Map<String, dynamic> content = {key: value};
      if (fileExists) {
        print("File exists");
        Map<String, dynamic> jsonFileContent =
            json.decode(jsonFile.readAsStringSync());
        if (jsonFileContent.containsKey(key) == true) {
          AwesomeDialog(
              context: context,
              animType: AnimType.BOTTOMSLIDE,
              headerAnimationLoop: true,
              dialogType: DialogType.ERROR,
              tittle: 'Espera',
              btnOkText: 'Entendido',
              dismissOnTouchOutside: true,
              desc:
                  'Este producto ya esta en tu carrito.',
              btnOkOnPress: () {
                debugPrint('OnClcik');
              },
              btnOkIcon: Icons.check_circle,
              onDissmissCallback: () {
                debugPrint('Dialog Dissmiss from callback');
              }).show();
        } else {
          print('djskdskdsldjslkdjskldjklsdjsdkl');
          jsonFileContent.addAll(content);
          jsonFile.writeAsStringSync(json.encode(jsonFileContent));
        }
      } else {
        print("File does not exist!");
        createFile(content, dir, fileName);
      }
      this.setState(
          () => fileContent = json.decode(jsonFile.readAsStringSync()));
      print(fileContent);
    }

    deleteToFile(String key) {
      print('Deleto to file!');
      Map<String, dynamic> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.remove(key);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
      this.setState(
          () => fileContent = json.decode(jsonFile.readAsStringSync()));
      print(fileContent);
    }

    // void runMyFuture(ProductoCart p) {
    //   print(
    //       "-----------------------------Entró al futuro------------------------------------------");
    //   addToCart(p).then((value) {
    //     print(
    //         'Se agregó el producto------------------------------------------------');
    //     widget.scaffoldKey.currentState.showSnackBar(SnackBar(
    //       content: Text('Se ha añadido el producto.'),
    //     ));

    //     // Run extra code here
    //   }, onError: (error) {
    //     print("----------------------------No se agregó el producto" +
    //         error.toString());
    //   });
    // }

    // void _showMyBottomSheet() {
    //   // the context of the bottomSheet will be this widget
    //   //the context here is where you want to showthe bottom sheet
    //   showBottomSheet(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return ShopBottomSheet(); // returns your BottomSheet widget
    //       });
    // }

    print(widget.product.image);
    return SizedBox(
      height: 200,
      child: Stack(
        children: <Widget>[
          images({
            widget.product.image,
            widget.product.image2,
            widget.product.image3
          }),
          Positioned(
            right: 0.0,
            child: Container(
              height: 180,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text('\$${widget.product.price ?? 0.0}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: shadow)),
                  ),
                  GestureDetector(
                    onTap: () async {
                      print('OK');
                      //_showMyBottomSheet();
                      //el write
                      print(
                          '-----------------------------antes del write---------------');

                      writeToFile(widget.product.id, widget.cantidad);
                      print(
                          '--------------------------------------salio--------------------------');
                      //print(fileContent);
                      //deleteToFile('product');
                    },
                    // onTap: () async {
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CheckOutPage()));
                    // },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: transparentPink,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'Agregar al carrito',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget images(images) {
    return SizedBox(
        height: 200.0,
        width: double.infinity,
        child: Carousel(
          autoplayDuration: Duration(seconds: images.length + 2),
          animationDuration: Duration(milliseconds: 2000),
          images: images.map(
            (url) {
              return Container(
                child: Image.network(
                    'http://petshome.com.mx/public_html/' + url,
                    fit: BoxFit.fill),
              );
            },
          ).toList(),
          dotSize: 4.0,
          dotSpacing: 15.0,
          dotColor: Colors.purpleAccent,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.black.withOpacity(0.5),
          borderRadius: true,
        ));
  }
}
