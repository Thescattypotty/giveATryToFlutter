import 'package:flutter/material.dart';
import 'package:giveatrytoflutter/components/customDrawer/custom_drawer.dart';
import 'package:giveatrytoflutter/services/auth_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        drawer: CustomDrawer(),
        body: MainContent());
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to Home Page",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          _logout(context),
        ],
      ),
    ));
  }
}

Widget _logout(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff0D6EFD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      minimumSize: const Size(double.infinity, 60),
      elevation: 0,
    ),
    onPressed: () async {
      await AuthService().logout(context: context);
    },
    child: Text(
      "Logout",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
