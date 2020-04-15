import 'package:apfmiranda/pages/login/login_page.dart';
import 'package:apfmiranda/pages/login/usuario.dart';
import 'package:apfmiranda/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Alexandre Miranda"),
                accountEmail: Text("alexandre.miranda@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSout9DCgwaNvSt74sc8vrpcdMZn8AnsSJuGNCPaztHa_SIrZAI&usqp=CAU"),
                ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("fav");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onclickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  _onclickLogout(BuildContext context) {
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
