import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_ecommerce/bottom_navigation/car_page.dart';
import 'package:project_ecommerce/bottom_navigation/home_tab.dart';
import 'package:project_ecommerce/bottom_navigation/profile_tab.dart';
import 'package:project_ecommerce/bottom_navigation/search_tab.dart';
import 'package:project_ecommerce/utils/my_page_view.dart';
import 'package:project_ecommerce/widgets/bottom_menu.dart';
import 'package:project_ecommerce/widgets/common/my_appbar.dart';
import 'package:project_ecommerce/widgets/common/search_bar.dart';

import 'check_out_page.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  //PageController _pageViewController;
  final _menu = [
    BottomMenuItem(icon: LineIcons.home, label: "Inicio", content: HomeTab()),
    BottomMenuItem(icon: LineIcons.search, label: "Buscar", content: SearchTab()),
    BottomMenuItem(
        icon: LineIcons.user, label: "Perfil", content: ProfileTab()),
    
  ];

  @override
  void initState() {
    super.initState();
    //_pageViewController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          
          Expanded(
            child: Center(
 
              child: SafeArea(
                  child: MyPageView(
                children: _menu.map<Widget>((item) => item.content).toList(),
                currentPage: _currentPage,
              )),
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: BottomMenu(
        items: _menu,
        currentPage: _currentPage,
        onChange: (int newCurrentPage,String label) {
          setState(() {
            _currentPage = newCurrentPage;
            if (label == "Carrito") {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CheckOutPage()));
            } else {
              _currentPage = newCurrentPage;
            }
          });
        },
      ),
    );
  }
}
