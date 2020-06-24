import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MyAppBar extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.height * 0.10,
            height: MediaQuery.of(context).size.width * 0.20,
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.picsum.photos/id/237/3500/2095.jpg'),
              backgroundColor: Colors.transparent,
            ),
          ),
          Container(
            child: Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                Text(
                  'Hola, Alan',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
                Text('¡Bienvenido!',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035),
                    textAlign: TextAlign.start)
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(right: 25),
            child: Icon(LineIcons.shopping_cart, size: 30,),
          )
        ],
      ),
    );
  }
}
