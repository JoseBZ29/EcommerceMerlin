
import 'package:flutter/material.dart';
import 'package:project_ecommerce/models/product.dart';

import '../../app_properties.dart';

class RecommendedList extends StatelessWidget {
  List<Product> products = [
    Product('assets/bag_1.png', 'Bag', 'Beautiful bag', '2.33'),
    Product('assets/cap_5.png', 'Cap', 'Cap with beautiful design', '10'),
    Product('assets/jeans_1.png', 'Jeans', 'Jeans for you', '20'),
    Product('assets/womanshoe_3.png', 'Woman Shoes', 'Shoes with special discount', '30'),
    Product('assets/bag_10.png', 'Bag Express', 'Bag for your shops', '40'),
    Product('assets/jeans_3.png', 'Jeans', 'Beautiful Jeans', '102.33'),
    Product('assets/ring_1.png', 'Silver Ring', 'Description', '52.33'),
    Product('assets/shoeman_7.png', 'Shoes', 'Description', '62.33'),
    Product('assets/headphone_9.png', 'Headphones', 'Description', '72.33'),


  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        
      ],
    );
  }
}
