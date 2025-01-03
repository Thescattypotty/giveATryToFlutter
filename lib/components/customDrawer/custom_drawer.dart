import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giveatrytoflutter/pages/home/home.dart';
import 'package:giveatrytoflutter/pages/options/fun-options.dart';
import 'package:giveatrytoflutter/pages/user/profile/profile.dart';
import 'package:giveatrytoflutter/services/auth_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        currentUser != null && currentUser.photoURL != null
                            ? NetworkImage(currentUser.photoURL!)
                            : const AssetImage("assets/image/profile.png")),
                Text(
                  FirebaseAuth.instance.currentUser!.displayName ?? "User Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  FirebaseAuth.instance.currentUser!.email ?? "User Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.black),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.black),
            title: Text("Profile"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.camera, color: Colors.black),
            title: Text("Fun Options"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FunOptions()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
            onTap: () async {
              await AuthService().logout(context: context);
            },
          ),
        ],
      ),
    );
  }
}
