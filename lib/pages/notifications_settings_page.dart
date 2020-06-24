import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ecommerce/app_properties.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool myOrders = true;
  bool reminders = true;
  bool newOffers = true;
  bool feedbackReviews = true;
  bool updates = true;

  Widget platformSwitch(bool val) {
    if (Platform.isIOS) {
      return CupertinoSwitch(
        onChanged: (value) {
          setState(() {
            val = value;
          });
        },
        value: true,
        activeColor: Colors.blue,
      );
    } else {
      return Switch(
        onChanged: (value) {
          setState(() {
            val = value;
          });
        },
        value: val,
        activeColor: yellow,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black,
          ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          'Notificaciones',
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top:24.0,left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 16.0),
              //   child: Text(
              //     'Notifications',
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18.0),
              //   ),
              // ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Ordenes'),
                      trailing: platformSwitch(myOrders),
                    ),
                    ListTile(
                      title: Text('Recordatorios'),
                      trailing: platformSwitch(reminders),
                    ),
                    ListTile(
                      title: Text('Ofertas'),
                      trailing: platformSwitch(newOffers),
                    ),
                    ListTile(
                      title: Text('Notificaciones'),
                      trailing: platformSwitch(feedbackReviews,)
                    ),
                    ListTile(
                      title: Text('Mensajes'),
                      trailing: platformSwitch(updates),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
