import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ecommerce/app_properties.dart';
import 'package:project_ecommerce/models/product.dart';
import 'package:project_ecommerce/providers/producto_provider.dart';
import 'package:project_ecommerce/widgets/common/my_appbar.dart';
import 'package:project_ecommerce/widgets/common/search_bar.dart';
import 'package:project_ecommerce/widgets/home/categories_list.dart';
import 'package:project_ecommerce/widgets/home/product_list.dart';


class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TabController tabController;
  TabController bottomTabController;
  final productos = new ProductoProvider();
  @override
  Widget build(BuildContext context) {
    hacer();

    return SafeArea(
        child: Column(
      children: <Widget>[
        MyAppBar(),
        SearchBar(),
        Expanded(child:
          SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text('Productos populares', style: TextStyle(fontSize: 25),),
                  padding: EdgeInsets.only(left:10, top: 10, bottom: 20),
                )
              ),
              hacer()
              ,
              SizedBox(height: 20,),
              CategoryList()
            ],
          ),
        )
        )
        
      ],
    ));
  }
  Widget hacer(){
    return FutureBuilder(
      future: productos.getProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return ProductList( products: snapshot.data);
        }else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}
