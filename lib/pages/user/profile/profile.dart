import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  String? _username;
  String? _email;
  String? _createdAt;

  Future<void> _getUserData() async {
    _user = _auth.currentUser;
    final userInfo = await FirebaseFirestore.instance
        .collection("users")
        .doc(_user!.uid)
        .get();
    if (userInfo.exists) {
      print("user exist ");
      _username = userInfo.get("username");
      _email = userInfo.get("email");
      _createdAt = userInfo.get("createdAt");
    } else {
      print("user not exist ");
      _username = "not Found";
      _email = "not Found";
      _createdAt = "not Found";
    }
  }

  @override
  Widget build(BuildContext context) {
    _getUserData();
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.blueAccent,
        ),
        body: _user == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: _user!.photoURL != null
                            ? NetworkImage(_user!.photoURL!)
                            : const AssetImage("image/profile.png"),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Username: $_username",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Email: $_email",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Created At: $_createdAt",
                        style: const TextStyle(fontSize: 20),
                      )
                    ]),
              ));
  }
}
