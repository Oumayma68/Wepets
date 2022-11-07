import 'package:wepets/Add/dashboard_screen.dart';
import 'package:wepets/Add/gin_screen.dart';
import 'package:wepets/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:wepets/screens/pets_page/navigation_drawer_wigdet.dart';
import 'package:wepets/screens/pets_page/data.dart';
import 'package:wepets/screens/pets_page/pet_widget.dart';
import 'package:wepets/screens/pets_page/category_list.dart';
import 'package:wepets/screens/profile/profile_edit.dart';
import 'package:wepets/screens/pets_page/favourites_page.dart';
import 'package:wepets/screens/pets_page/add_pet.dart';
import 'package:wepets/screen/login_screen.dart';
class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Edit profile';
    final email = '';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
             onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>ProfilePage(
                ),
              )),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              padding: padding,
              child: Column(
                children: [

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Profile',
                    icon: Icons.perm_identity,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Add a Pet ',
                    icon: Icons.pets_sharp,
                    onClicked: () => selectedItem(context, 2),
                  ),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'logout',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
        color: Color.fromARGB(245,202,237,235),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DashboardScreen(),




        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>ginScreen(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>HomeScreen(),
        ));
        break;



    }
  }
}
