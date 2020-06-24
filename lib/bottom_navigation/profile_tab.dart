import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_ecommerce/pages/auth/welcome_back_page.dart';
import 'package:project_ecommerce/pages/change_password_page.dart';
import 'package:project_ecommerce/pages/faq_page.dart';
import 'package:project_ecommerce/pages/notifications_settings_page.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
          bottom: true,
          child: LayoutBuilder(
                      builder:(builder,constraints)=> SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'General',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  
                   
                   ListTile(
                    title: Text('Notifications'),
                     leading: Icon(LineIcons.bell),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => NotificationSettingsPage())),
                  ),
                  ListTile(
                    title: Text('Pedidos'),
                     leading: Icon(LineIcons.archive),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => NotificationSettingsPage())),
                  ),
                   
                   ListTile(
                    title: Text('Acerca de nosotros'),
                     leading: Icon(LineIcons.info_circle),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text('FAQ'),
                     leading: Icon(LineIcons.question_circle),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => FaqPage())),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      'Cuenta',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: Text('Editar datos personales'),
                    leading: Icon(LineIcons.gears),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ChangePasswordPage())),
                  ),
                  ListTile(
                    title: Text('Cerrar Sesión'),
                      leading:  Icon(LineIcons.sign_out),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => WelcomeBackPage())),
                  ),
                  
                ],
              ),
            ),
                        ),
                      )
          ),
        );
      
    
  }
}