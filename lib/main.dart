
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:project_ecommerce/pages/splash_page.dart';
import 'package:project_ecommerce/routes/routes.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
   
    return MaterialApp(
        
  
  locale: Locale('es'),  // Current locale
  supportedLocales: [
    const Locale('en', 'US'), // English
    
  ],
 
        //home: SplashPage(),
        home: SplashScreen(),
        routes: getAplicationRoute(),
        debugShowCheckedModeBanner: false,
        
    );
  }
}