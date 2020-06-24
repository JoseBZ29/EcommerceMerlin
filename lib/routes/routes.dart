import 'package:flutter/material.dart';
import 'package:project_ecommerce/pages/home_page.dart';
import 'package:project_ecommerce/widgets/checkout/address_form.dart';

Map<String, WidgetBuilder> getAplicationRoute() {
  return <String, WidgetBuilder>{

    'Home': (BuildContext context) => HomePage(),
    'add_address': (BuildContext context) => AddAddressForm()
    
  };
}
