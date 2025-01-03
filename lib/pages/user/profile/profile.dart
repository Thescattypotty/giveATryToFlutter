import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:giveatrytoflutter/components/customDrawer/custom_drawer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  String? _username;
  String? _dateNaissance;
  String? _adressePostale;
  String? _telephone;
  String? _profession;
  String? _createdAt;
  String? _updatedAt;

  final List<String> _professionOptions = [
    "Doctor",
    "Student",
    "Teacher",
    "Engineer",
    "Lawyer",
    "Nurse",
    "Artist",
    "Farmer",
    "Driver",
    "Cook",
    "Waiter",
    "Cleaner",
    "Security",
    "Mechanic",
    "Electrician",
    "Plumber",
    "Carpenter",
    "Tailor",
    "Hairdresser",
    "Beautician",
    "Photographer",
    "Journalist",
    "Other"
  ];

  final _formKey = GlobalKey<FormState>();

  // Contrôleurs
  final _usernameController = TextEditingController();
  final _dateNaissanceController = TextEditingController();
  final _adressePostaleController = TextEditingController();
  final _telephoneController = TextEditingController();

  Future<void> _getUserData() async {
    _user = _auth.currentUser;
    final userInfo = await FirebaseFirestore.instance
        .collection("users")
        .doc(_user!.uid)
        .get();
    if (userInfo.exists) {
      setState(() {
        _usernameController.text = userInfo.get("username");
        _dateNaissanceController.text = userInfo.get("dateNaissance");
        _adressePostaleController.text = userInfo.get("adressePostale");
        _telephoneController.text = userInfo.get("telephone");
        _profession = userInfo.get("profession");
        _createdAt = userInfo.get("createdAt");
        _updatedAt = userInfo.get("updatedAt");
        if (_profession?.isEmpty ?? true) {
          _profession = null;
        } else if (!_professionOptions.contains(_profession)) {
          _profession = null;
        }
      });
    } else {
      setState(() {
        _usernameController.text = "";
        _dateNaissanceController.text = "";
        _adressePostaleController.text = "";
        _telephoneController.text = "";
        _profession = "";
        _createdAt = "";
        _updatedAt = "";
      });
    }
  }

  Future<void> _saveUserData() async {
    final userDoc =
        FirebaseFirestore.instance.collection("users").doc(_user!.uid);
    final data = {
      "username": _username,
      "dateNaissance": _dateNaissance,
      "adressePostale": _adressePostale,
      "telephone": _telephone,
      "profession": _profession,
      "createdAt": _createdAt ?? FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
    };
    await userDoc.set(data, SetOptions(merge: true));
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: _user == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(17.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: "Username"),
                      onChanged: (value) {
                        _username = value;
                      },
                    ),
                    TextFormField(
                      controller: _dateNaissanceController,
                      decoration:
                          InputDecoration(labelText: "Date de Naissance"),
                      onChanged: (value) {
                        _dateNaissance = value;
                      },
                    ),
                    TextFormField(
                      controller: _adressePostaleController,
                      decoration: InputDecoration(labelText: "Adresse Postale"),
                      onChanged: (value) {
                        _adressePostale = value;
                      },
                    ),
                    TextFormField(
                      controller: _telephoneController,
                      decoration: InputDecoration(labelText: "Téléphone"),
                      onChanged: (value) {
                        _telephone = value;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: _profession,
                      decoration: InputDecoration(labelText: "Profession"),
                      items: _professionOptions
                          .map((profession) => DropdownMenuItem(
                                key: Key(profession),
                                value: profession,
                                child: Text(profession),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _profession = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _saveUserData().then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      "Données enregistrées avec succès !")),
                            );
                          });
                        }
                      },
                      child: Text("Enregistrer"),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
