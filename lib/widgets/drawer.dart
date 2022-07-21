import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageURL =
        "https://images.hindustantimes.com/img/2021/10/08/550x309/WhatsApp_Image_2021-10-08_at_5.37.05_PM_1633694844878_1633694863024.jpeg";
    return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: UserAccountsDrawerHeader(
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: Colors.black26,

                        ),
                        accountName: Text(
                          "Yashwant Singh Rathore",
                          style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white54,
                        ),
                        ),

                        accountEmail: Text(
                          "yashwantsingh162@gmail.com",
                          style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white54,
                        ),
                        ),



                        //currentAccountPicture: Image.network(imageURL),   simple image adder
                          currentAccountPicture: CircleAvatar(
                            backgroundImage: NetworkImage(imageURL),
                          ),
                    ),

                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                  ),
                  title: Text("Home",
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      ),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                  ),
                  title: Text("Profile",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                    ),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    CupertinoIcons.mail,
                  ),
                  title: Text("Mail Us",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                    ),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    CupertinoIcons.settings_solid,
                  ),
                  title: Text("Settings",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                    ),
                  ),
                ),

              ],
            ),
    );
  }
}
